import 'package:cinema_vendor/screens/add_movie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/movie_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cinema_vendor/components/red_rounded_action_button.dart';
import 'screens/buy_ticket.dart';
import 'components/primary_rounder_button.dart';
import 'model.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CinemaVendor());
}

class CinemaVendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinema Vendor',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {

  int index = 1;

  String currentID;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _fStore = FirebaseFirestore.instance;

  Future <List<Movie>> getData () async {
    final QuerySnapshot item = await _fStore.collection('movies').get();
    List<Movie> movies = [];
    item.docs.forEach((element) {
      movies.add(
          Movie(
            title: element.data()['title'],
            imageURL: element.data()['image'],
            date: element.data()['date'],
            id: element.data()['id'],
            i: element.id,
          ));
    }
    );
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    bool showSpinner = false;

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                MovieAppBar(),
                Expanded(
                  child: FutureBuilder (
                    future: getData(), // function where you call your api
                    builder: (BuildContext context, snapshot) {  // AsyncSnapshot<Your object type>
                      if( snapshot.connectionState == ConnectionState.waiting){
                        return  Center(child: Text('Please wait its loading...'));
                      } else {

                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return MovieCard(
                                  title: snapshot.data[index].title,
                                  imageLink: snapshot.data[index].imageURL,
                                  i: snapshot.data[index].i,
                                  active: index == widget.index
                                      ? true
                                      : false,
                                  callBack: () {
                                    setState(() {
                                      widget.currentID = snapshot.data[index].i;
                                      widget.index = index;
                                    });
                                  });
                            }); // snapshot.data  :- get your object which is pass from your downloadData() function
                      } },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: FutureBuilder (
                    future: getData(),
                    builder: (BuildContext context, snapshot) {
                      if( snapshot.connectionState == ConnectionState.waiting)
                      {
                        return Center(child: Text('Please wait its loading...'));
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(snapshot.data[widget.index].date, style: kSmallMainTextStyle),
                          ],
                        );
                      }},
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    PrimaryRoundedButton(
                        text: 'Add Movie',
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddMovie(),
                            ),
                          );
                        }
                    ),
                    PrimaryRoundedButton(
                      text: 'Delete Movie',
                      callback: ()  async {
                        if (widget.currentID != null) {
                          await FirebaseFirestore.instance.collection('movies')
                              .doc(widget.currentID)
                              .delete();
                        }
                        print(widget.index);
                        print(widget.currentID);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder (
                      future: getData(), // function where you call your api
                      builder: (BuildContext context, snapshot) {  // AsyncSnapshot<Your object type>
                        if( snapshot.connectionState == ConnectionState.waiting){
                          return  Center(child: Text('Please wait its loading...'));
                        } else {
                          return RedRoundedActionButton(
                            callback: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BuyTicket(snapshot.data[widget.index].title,
                                      snapshot.data[widget.index].id,
                                          snapshot.data[widget.index].seats,
                                          snapshot.data[widget.index].i,),
                                ),
                              );
                            },
                            text: 'Check Seats',
                          ); // snapshot.data  :- get your object which is pass from your downloadData() function
                      } },
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class MovieCard extends StatelessWidget {
  final String imageLink;

  final String title;

  int id;

  String i;

  String desc;

  final Function callBack;

  final bool active;

  MovieCard(
      { this.title,
        this.imageLink,
        this.callBack,
        this.active,
        this.id,
        this.desc,
      this.i});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: callBack,
            child: SizedBox(
              width: active
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  imageLink,
                  width: 80,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text(active ? title : '',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),

      ],
    );
  }
}




