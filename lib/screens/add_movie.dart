import 'package:flutter/material.dart';
import 'package:cinema_vendor/const.dart';
import 'package:cinema_vendor/components/primary_rounder_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddMovie extends StatelessWidget {

  String movieName;
  String description;
  String time;
  String imgURL;

  bool showSpinner = false;

  final _fStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold (
        backgroundColor: kBackgroundColor,
        appBar: AppBar (
          title: Text (
            'Add New Movie',
            style: kMainTextStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Text(
                'Movie Name',
                style: kMainTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                onChanged: (value) {
                  movieName = value;
                },
                decoration: kTextDecoration,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Image File Name',
                style: kMainTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                onChanged: (value) {
                  imgURL = value;
                },
                decoration: kTextDecoration,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Time & Date',
                style: kMainTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                onChanged: (value) {
                  time = value;
                },
                decoration: kTextDecoration,
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryRoundedButton(
                    text: 'Add Movie',
                    callback: () {

                      showSpinner = true;


                      _fStore.collection('movies').add({
                        'title': movieName,
                        'date': time,
                        'image': imgURL,
                      });

                      showSpinner = false;

                    } ,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
