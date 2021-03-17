import 'package:flutter/material.dart';

class Movie {
  String title;

  int id;

  String i;

  String age;

  String categories;

  String imageURL;

  double rating;

  String technology;

  String date;

  List<int> seats = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];

  Movie(
      { this.title,
        this.imageURL,
        this.age,
        this.rating,
        this.date,
        this.categories,
        this.technology,
        this.id,
      this.i});
}