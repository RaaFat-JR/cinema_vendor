import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPimaryColor = Color(0xffF7BB0E);

const kActionColor = Color(0xffF00000);

const kBackgroundColor = Color(0xff29282C);
const kMovieNameStyle =
TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white , );
final kMainTextStyle = GoogleFonts.barlow(
    textStyle: TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold));
final kSmallMainTextStyle = kMainTextStyle.copyWith(fontSize: 16.0);

final kPromaryColorTextStyle =
TextStyle(color: kPimaryColor, fontSize: 18.0, fontWeight: FontWeight.bold);

final BoxDecoration kRoundedFadedBorder = BoxDecoration(
    border: Border.all(color: Colors.white54, width: .5),
    borderRadius: BorderRadius.circular(15.0));

final ThemeData theme =
ThemeData.dark().copyWith(textTheme: GoogleFonts.barlowTextTheme());

const kTextDecoration = InputDecoration(
  hintText: 'Type here...',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);