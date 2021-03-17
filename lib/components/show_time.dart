import 'package:flutter/material.dart';

import '../const.dart';

// ignore: must_be_immutable
class ShowTime extends StatefulWidget {

  bool isActive;
  final String time;

  ShowTime(
      {@required this.time,
        this.isActive = false});

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.isActive ? kPimaryColor : Colors.white12),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                widget.time,
                style: TextStyle(
                    color: widget.isActive ? kPimaryColor : Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
