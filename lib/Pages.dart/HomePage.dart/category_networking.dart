import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:dimex/TripData.dart/models.dart/categorizedPlaces.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'CategoryPages.dart/category_List.dart';
import 'dart:async';

Trip trip = Trip();
PlaceData placeData = PlaceData();

// 1
class TripCategories {
  Future<SpecificPlaceInfo> getSpecificPlace(String xid) async {
    SpecificPlaceInfo _foodInfo = await placeData.specificPlaces(xid);
    return _foodInfo;
  }

  Future<List<CategorizedPlaces>> getAllListData(
    CategoryTpes category,
  ) async {
    List<CategorizedPlaces> categoryDataNetwork =
        await TripCategories.getNetworkAllCategoryList(category);
    print('data got from network ${categoryDataNetwork.length}');

    return categoryDataNetwork;
  }

// http request to get all data
  static Future<List<CategorizedPlaces>> getNetworkAllCategoryList(
      CategoryTpes category) async {
    List<CategorizedPlaces> _temp;
    switch (category) {
      case CategoryTpes.natural:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              'urban_environment,natural',
              2.toString());
        }
        break;
      case CategoryTpes.foods:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              'accomodations,foods',
              0.toString());
        }
        break;
      case CategoryTpes.historic:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              'architecture,historic',
              1.toString());
        }
        break;
      case CategoryTpes.museums:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              'museums',
              1.toString());
        }
        break;
      case CategoryTpes.religion:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              'religion',
              1.toString());
        }
        break;
      case CategoryTpes.sport:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              'sport,amusements',
              1.toString());
        }
        break;
      case CategoryTpes.shops:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              'shops,theatres_and_entertainments',
              1.toString());
        }
        break;
      case CategoryTpes.adult:
        {
          _temp = await trip.categorizedPlaces(
              28.6304.toString(),
              77.2177.toString(),
              60000.toString(),
              500.toString(),
              ' adult',
              1.toString());
        }
        break;
    }

    return _temp;
  }
}
