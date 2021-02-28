import 'package:flutter/material.dart';


import 'category_pages.dart';
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
      name: 'Party & Clubs',
      assetName: 'assets/party.jpg',
      classname: PartyFeed.routeName,
      ),

  PlaceCategories(
      categoryTpes:  CategoryTpes.foods,
      color: Colors.blue,
      name: 'Hotels & Foods',
      assetName: 'assets/food.jpg',
      classname: FoodFeed.routeName
      ),
  PlaceCategories(
      categoryTpes: CategoryTpes.historic,
      color: Colors.blue,
      name: 'Historical',
      assetName: 'assets/historical.jpg',
      classname: HistoryFeed.routeName
      ),
  PlaceCategories(
      categoryTpes: CategoryTpes.museums,
      color: Colors.blue,
      name: 'Museums',
      assetName: 'assets/museum.jpg',
      classname: MuseumFeed.routeName
      ),
  PlaceCategories(
      categoryTpes: CategoryTpes.religion,
      color: Colors.blue,
      name: 'Temples',
      assetName: 'assets/temple.jpg',
      classname: TempleFeed.routeName
      ),
  PlaceCategories(
      categoryTpes:  CategoryTpes.natural,
      color: Colors.blue,
      name: 'Park & Nature',
      assetName: 'assets/nature.jpg',
      classname: NatureFeed.routeName
      ),
  PlaceCategories(
      categoryTpes: CategoryTpes.shops,
      color: Colors.blue,
      name: 'Market & Shops',
      assetName: 'assets/market.jpg',
      classname: ShopFeed.routeName,
      ),
  PlaceCategories(
      categoryTpes: CategoryTpes.sport,
      color: Colors.blue,
      name: 'Stadium & Sport',
      assetName: 'assets/stadium.jpg',
      classname: SportFeed.routeName,
      ),


];

class PlaceCategories {
  CategoryTpes categoryTpes;
  String name;
  Color color;
  String assetName;
   String classname;

  PlaceCategories({this.categoryTpes, this.color, this.name,this.assetName, @required this.classname});
}
