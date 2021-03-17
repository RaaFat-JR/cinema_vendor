
import 'package:flutter/material.dart';

import '../const.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // todo: convert this to it's own widget
        Container(
          width: MediaQuery.of(context).size.width * .80,
          height: 60.0,
          decoration: kRoundedFadedBorder,
          child: Center(
            child: Text (
              'Cinema Reservation App',
              style: TextStyle(fontSize:25.0 , fontWeight: FontWeight.bold , color:Colors.white ,letterSpacing: 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
