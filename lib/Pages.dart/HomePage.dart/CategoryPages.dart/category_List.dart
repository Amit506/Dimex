import 'package:flutter/material.dart';

enum CategoryTpes {
  // accomodations,
  // amusements,
  // architecture,
  historic,
  museums,
  // urban_environment,
  religion,
  adult,
  // theatres_and_entertainments,
  natural,
  // other,
  sport,
  foods,
  // transport,
  shops,
}

List<PlaceCategories> categoryListName = [
  PlaceCategories(
      categoryTpes: CategoryTpes.adult,
      color: Colors.blue,
      name: 'Party & Clubs'),
  PlaceCategories(
      categoryTpes:  CategoryTpes.foods,
      color: Colors.blue,
      name: 'Hotels & Foods'),
  PlaceCategories(
      categoryTpes: CategoryTpes.historic,
      color: Colors.blue,
      name: 'Historical'),
  PlaceCategories(
      categoryTpes: CategoryTpes.museums,
      color: Colors.blue,
      name: 'Museums'),
  PlaceCategories(
      categoryTpes: CategoryTpes.religion,
      color: Colors.blue,
      name: 'Temples'),
  PlaceCategories(
      categoryTpes:  CategoryTpes.natural,
      color: Colors.blue,
      name: 'Park & Nature'),
  PlaceCategories(
      categoryTpes: CategoryTpes.shops,
      color: Colors.blue,
      name: 'Market & Shops'),
  PlaceCategories(
      categoryTpes: CategoryTpes.sport,
      color: Colors.blue,
      name: 'Stadium & Sport'),


];

class PlaceCategories {
  CategoryTpes categoryTpes;
  String name;
  Color color;
  PlaceCategories({this.categoryTpes, this.color, this.name});
}
