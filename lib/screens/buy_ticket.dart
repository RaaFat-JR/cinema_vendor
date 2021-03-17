import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cinema_vendor/components/cienma_seat.dart';
import 'package:cinema_vendor/components/show_time.dart';
import '../const.dart';

class BuyTicket extends StatefulWidget {
  var title;
  int movieId;
  String i;
  List<dynamic> seats;
  BuyTicket(this.title, this.movieId, this.seats, this.i);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  var _isInit = false;
  var _isLoading = false;

  void didChangeDependencies() async {
    if (!_isInit) {
      setState(() {
        _isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection("movies")
          .doc(widget.i)
          .snapshots()
          .listen((event) {
        {
          widget.seats = event.get("seats");
          print(widget.title);
          print(widget.seats);
        }
      });
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 0.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .15,
                    height: 60.0,
                    decoration: kRoundedFadedBorder,
                    child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_left),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    isActive: true,
                  ),
                  ShowTime(
                    time: '12:30',
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    isActive: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
            ),
            Center(child: Image.asset('images/screen.png')),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(
                        id: 0,
                        movieId: widget.movieId,
                        isReserved: widget.seats[0] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 1,
                        movieId: widget.movieId,
                        isReserved: widget.seats[1] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 2,
                        movieId: widget.movieId,
                        isReserved: widget.seats[2] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width:
                        (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        id: 3,
                        movieId: widget.movieId,
                        isReserved: widget.seats[3] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 4,
                        movieId: widget.movieId,
                        isReserved: widget.seats[4] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                        id: 5,
                        movieId: widget.movieId,
                        isReserved: widget.seats[5] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 6,
                        movieId: widget.movieId,
                        isReserved: widget.seats[6] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 7,
                        movieId: widget.movieId,
                        isReserved: widget.seats[7] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 8,
                        movieId: widget.movieId,
                        isReserved: widget.seats[8] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width:
                        (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        id: 9,
                        movieId: widget.movieId,
                        isReserved: widget.seats[9] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 10,
                        movieId: widget.movieId,
                        isReserved: widget.seats[10] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 11,
                        movieId: widget.movieId,
                        isReserved: widget.seats[11] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                    ],
                  ),
                  // Third  Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                        id: 12,
                        movieId: widget.movieId,
                        isReserved: widget.seats[12] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 13,
                        movieId: widget.movieId,
                        isReserved: widget.seats[13] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 14,
                        movieId: widget.movieId,
                        isReserved: widget.seats[14] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 15,
                        movieId: widget.movieId,
                        isReserved: widget.seats[15] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width:
                        (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        id: 16,
                        movieId: widget.movieId,
                        isReserved: widget.seats[16] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 17,
                        movieId: widget.movieId,
                        isReserved: widget.seats[17] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 18,
                        movieId: widget.movieId,
                        isReserved: widget.seats[18] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                    ],
                  ),
                  // 4TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                        id: 19,
                        movieId: widget.movieId,
                        isReserved: widget.seats[19] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 20,
                        movieId: widget.movieId,
                        isReserved: widget.seats[20] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 21,
                        movieId: widget.movieId,
                        isReserved: widget.seats[21] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 22,
                        movieId: widget.movieId,
                        isReserved: widget.seats[22] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width:
                        (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        id: 23,
                        movieId: widget.movieId,
                        isReserved: widget.seats[23] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 24,
                        movieId: widget.movieId,
                        isReserved: widget.seats[24] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 25,
                        movieId: widget.movieId,
                        isReserved: widget.seats[25] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                    ],
                  ),
                  // 5TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                        id: 26,
                        movieId: widget.movieId,
                        isReserved: widget.seats[26] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 27,
                        movieId: widget.movieId,
                        isReserved: widget.seats[27] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 28,
                        movieId: widget.movieId,
                        isReserved: widget.seats[28] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 29,
                        movieId: widget.movieId,
                        isReserved: widget.seats[29] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width:
                        (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        id: 30,
                        movieId: widget.movieId,
                        isReserved: widget.seats[30] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 31,
                        movieId: widget.movieId,
                        isReserved: widget.seats[31] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 32,
                        movieId: widget.movieId,
                        isReserved: widget.seats[32] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                    ],
                  ),
                  // 6TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(
                        id: 33,
                        movieId: widget.movieId,
                        isReserved: widget.seats[33] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 34,
                        movieId: widget.movieId,
                        isReserved: widget.seats[34] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 35,
                        movieId: widget.movieId,
                        isReserved: widget.seats[35] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 36,
                        movieId: widget.movieId,
                        isReserved: widget.seats[36] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width:
                        (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        id: 37,
                        movieId: widget.movieId,
                        isReserved: widget.seats[37] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 38,
                        movieId: widget.movieId,
                        isReserved: widget.seats[38] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 39,
                        movieId: widget.movieId,
                        isReserved: widget.seats[39] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                    ],
                  ),
                  // final Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(
                        id: 40,
                        movieId: widget.movieId,
                        isReserved: widget.seats[40] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 41,
                        movieId: widget.movieId,
                        isReserved: widget.seats[41] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 42,
                        movieId: widget.movieId,
                        isReserved: widget.seats[42] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width:
                        (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        id: 43,
                        movieId: widget.movieId,
                        isReserved: widget.seats[43] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 44,
                        movieId: widget.movieId,
                        isReserved: widget.seats[44] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 45,
                        movieId: widget.movieId,
                        isReserved: widget.seats[45] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      CienmaSeat(
                        id: 46,
                        movieId: widget.movieId,
                        isReserved: widget.seats[46] == 0 ? false : true,
                        i: widget.i,
                        seats: widget.seats,
                        title: widget.title,
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.only(left: 235.0),
            //         child: Container(
            //           padding: EdgeInsets.symmetric(
            //               horizontal: 40.0, vertical: 10.0),
            //           decoration: BoxDecoration(
            //               color: kActionColor,
            //               borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(25.0))),
            //           child: InkWell(
            //               child: Text('BOOK',
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 25.0,
            //                       fontWeight: FontWeight.bold))),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}