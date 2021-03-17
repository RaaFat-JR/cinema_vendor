
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../model.dart';

// ignore: must_be_immutable
class CienmaSeat extends StatefulWidget {
  String i;
  List<dynamic> seats;
  int movieId;
  int id;
  bool isReserved;
  bool firstPress = true;
  Movie movie;
  String title;
  final _fStore = FirebaseFirestore.instance;
  bookSeat(int idd, int movieIdd) {
    seats[idd] = 1;
  }

  CienmaSeat(
      {@required this.id,
        @required this.isReserved,
        @required this.movieId,
        @required this.i,
        @required this.seats,
        @required this.title});

  @override
  _CienmaSeatState createState() => _CienmaSeatState(seats: seats, i: i);
}

class _CienmaSeatState extends State<CienmaSeat> {
  List<dynamic> seats;
  String i;
  _CienmaSeatState({@required this.seats, @required this.i});

  @override
  void setState(fn) async {
    super.setState(fn);
    await FirebaseFirestore.instance
        .collection("movies")
        .doc(i)
        .snapshots()
        .listen((event) {
      {
        widget.seats = event.get("seats");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        setState(() {
          if (!widget.isReserved) {
            widget.bookSeat(widget.id, widget.movieId);
            widget.firstPress = false;
            widget.isReserved = true;
          }
        });
        await FirebaseFirestore.instance
            .collection('movies')
            .doc(widget.i)
            .update({'seats': widget.seats});
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.seats[widget.id] == 1 ? kPimaryColor : null,
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}