import 'package:dimex/Pages.dart/HomePage.dart/category_networking.dart';
import 'package:dimex/TripData.dart/Foods.dart/Networking&Modals/Network.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:dimex/TripData.dart/models.dart/categorizedPlaces.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'category_List.dart';
import 'dart:async';

class HistoricalDataProvider extends ChangeNotifier {
  TripCategories tripCategories = TripCategories();

  bool isLoading = false;

  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<CategorizedPlaces>> getAllAvailabeData() async {
    List<CategorizedPlaces> networkPlaces =
        await tripCategories.getAllListData(CategoryTpes.historic);
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getPecificPlaceSubList(
      List<CategorizedPlaces> categoryPlaceList) async {
    print(
        '///////////////////////////////////////////////////////////////////////////////////');
    isLoading = true;
    notifyListeners();

    print('current Index $currentIndex');
    var iterator = categoryPlaceList
        .getRange(currentIndex, categoryPlaceList.length)
        .iterator;
    print('length of iterator : ${categoryPlaceList.length}');

    List<SpecificPlaceInfo> temp = [];
    temp.clear();
    print(' tempoprary iniitial length ${temp.length}');
    print('main initial list ${subListOfSpecifPlaces.length}');
    print(' length $start');
    start = start + 2;

    notifyListeners();
    while (subListOfSpecifPlaces.length < start) {
      while (iterator.moveNext()) {
        currentIndex = currentIndex + 1;
        print(currentIndex);
        if (iterator.current.xid != null) {
          SpecificPlaceInfo _specificPlaceInfo =
              await tripCategories.getSpecificPlace(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null &&
              !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
            temp.add(_specificPlaceInfo);
            print('************');
            print(_specificPlaceInfo.xid);
            print('************');
            subListOfSpecifPlaces.add(_specificPlaceInfo);
            notifyListeners();
          }

          if (temp.length == 2) {
            isLoading = false;
            break;
          }
        }
      }
    }

    // controller.add(event)
    notifyListeners();
    print('temporary final length ${temp.length}');
    print('main list final  ${subListOfSpecifPlaces.length}');

    return subListOfSpecifPlaces;
  }
}

class SportCategoryProvider extends ChangeNotifier {
  TripCategories tripCategories = TripCategories();

  bool isLoading = false;

  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<CategorizedPlaces>> getAllAvailabeData() async {
    List<CategorizedPlaces> networkPlaces =
        await tripCategories.getAllListData(CategoryTpes.sport);
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getsPecificPlaceSubList(
      List<CategorizedPlaces> categoryPlaceList) async {
    print(
        '///////////////////////////////////////////////////////////////////////////////////');
    isLoading = true;
    notifyListeners();

    print('current Index $currentIndex');
    var iterator = categoryPlaceList
        .getRange(currentIndex, categoryPlaceList.length)
        .iterator;
    print('length of iterator : ${categoryPlaceList.length}');

    List<SpecificPlaceInfo> temp = [];
    temp.clear();
    print(' tempoprary iniitial length ${temp.length}');
    print('main initial list ${subListOfSpecifPlaces.length}');
    print(' length $start');
    start = start + 2;

    notifyListeners();
    while (subListOfSpecifPlaces.length < start) {
      while (iterator.moveNext()) {
        currentIndex = currentIndex + 1;
        print(currentIndex);
        if (iterator.current.xid != null) {
          SpecificPlaceInfo _specificPlaceInfo =
              await tripCategories.getSpecificPlace(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null &&
              !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
            temp.add(_specificPlaceInfo);
            print('************');
            print(_specificPlaceInfo.xid);
            print('************');
            subListOfSpecifPlaces.add(_specificPlaceInfo);
            notifyListeners();
          }

          if (temp.length == 2) {
            isLoading = false;
            break;
          }
        }
      }
    }

    // controller.add(event)
    notifyListeners();
    print('temporary final length ${temp.length}');
    print('main list final  ${subListOfSpecifPlaces.length}');

    return subListOfSpecifPlaces;
  }
}

class MuseumDataProvider extends ChangeNotifier {
  TripCategories tripCategories = TripCategories();

  bool isLoading = false;

  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<CategorizedPlaces>> getAllAvailabeData(
     ) async {
    List<CategorizedPlaces> networkPlaces =
        await tripCategories.getAllListData(CategoryTpes.museums);
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getSubList(
      List<CategorizedPlaces> categoryPlaceList) async {
    print(
        '///////////////////////////////////////////////////////////////////////////////////');
    isLoading = true;
    notifyListeners();

    print('current Index $currentIndex');
    var iterator = categoryPlaceList
        .getRange(currentIndex, categoryPlaceList.length)
        .iterator;
    print('length of iterator : ${categoryPlaceList.length}');

    List<SpecificPlaceInfo> temp = [];
    temp.clear();
    print(' tempoprary iniitial length ${temp.length}');
    print('main initial list ${subListOfSpecifPlaces.length}');
    print(' length $start');
    start = start + 2;

    notifyListeners();
    while (subListOfSpecifPlaces.length < start) {
      while (iterator.moveNext()) {
        currentIndex = currentIndex + 1;
        print(currentIndex);
        if (iterator.current.xid != null) {
          SpecificPlaceInfo _specificPlaceInfo =
              await tripCategories.getSpecificPlace(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null &&
              !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
            temp.add(_specificPlaceInfo);
            print('************');
            print(_specificPlaceInfo.xid);
            print('************');
            subListOfSpecifPlaces.add(_specificPlaceInfo);
            notifyListeners();
          }

          if (temp.length == 2) {
            isLoading = false;
            break;
          }
        }
      }
    }

    // controller.add(event)
    notifyListeners();
    print('temporary final length ${temp.length}');
    print('main list final  ${subListOfSpecifPlaces.length}');

    return subListOfSpecifPlaces;
  }
}

class PartyDataProvider extends ChangeNotifier {
  TripCategories tripCategories = TripCategories();

  bool isLoading = false;

  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<CategorizedPlaces>> getAllAvailabeData(
      ) async {
    List<CategorizedPlaces> networkPlaces =
        await tripCategories.getAllListData(CategoryTpes.adult);
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getSubList(
      List<CategorizedPlaces> categoryPlaceList) async {
    print(
        '///////////////////////////////////////////////////////////////////////////////////');
    isLoading = true;
    notifyListeners();

    print('current Index $currentIndex');
    var iterator = categoryPlaceList
        .getRange(currentIndex, categoryPlaceList.length)
        .iterator;
    print('length of iterator : ${categoryPlaceList.length}');

    List<SpecificPlaceInfo> temp = [];
    temp.clear();
    print(' tempoprary iniitial length ${temp.length}');
    print('main initial list ${subListOfSpecifPlaces.length}');
    print(' length $start');
    start = start + 2;

    notifyListeners();
    while (subListOfSpecifPlaces.length < start) {
      while (iterator.moveNext()) {
        currentIndex = currentIndex + 1;
        print(currentIndex);
        if (iterator.current.xid != null) {
          SpecificPlaceInfo _specificPlaceInfo =
              await tripCategories.getSpecificPlace(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null &&
              !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
            temp.add(_specificPlaceInfo);
            print('************');
            print(_specificPlaceInfo.xid);
            print('************');
            subListOfSpecifPlaces.add(_specificPlaceInfo);
            notifyListeners();
          }

          if (temp.length == 2) {
            isLoading = false;
            break;
          }
        }
      }
    }

    // controller.add(event)
    notifyListeners();
    print('temporary final length ${temp.length}');
    print('main list final  ${subListOfSpecifPlaces.length}');

    return subListOfSpecifPlaces;
  }
}

class FoodsDataProvider extends ChangeNotifier {






   Future getcityFoodData()async{

 CityNetworking cityNetworking= CityNetworking();
 List nearRestaurant=await cityNetworking.cityRestaurants();
 return nearRestaurant;
   }

           
  // TripCategories tripCategories = TripCategories();

  // bool isLoading = false;

  // List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  // int currentIndex = 0;
  // int length = 0;
  // int start = 0;
  // Future<List<CategorizedPlaces>> getAllAvailabeData() async {
  //   List<CategorizedPlaces> networkPlaces =
  //       await tripCategories.getAllListData(CategoryTpes.foods);
  //   length = networkPlaces.length;
  //   notifyListeners();
  //   return networkPlaces;
  // }

  // Future<List<SpecificPlaceInfo>> getSubList(
  //     List<CategorizedPlaces> categoryPlaceList) async {
  //   print(
  //       '///////////////////////////////////////////////////////////////////////////////////');
  //   isLoading = true;
  //   notifyListeners();

  //   print('current Index $currentIndex');
  //   var iterator = categoryPlaceList
  //       .getRange(currentIndex, categoryPlaceList.length)
  //       .iterator;
  //   print('length of iterator : ${categoryPlaceList.length}');

  //   List<SpecificPlaceInfo> temp = [];
  //   temp.clear();
  //   print(' tempoprary iniitial length ${temp.length}');
  //   print('main initial list ${subListOfSpecifPlaces.length}');
  //   print(' length $start');
  //   start = start + 2;

  //   notifyListeners();
  //   while (subListOfSpecifPlaces.length < start) {
  //     while (iterator.moveNext()) {
  //       currentIndex = currentIndex + 1;
  //       print(currentIndex);
  //       if (iterator.current.xid != null) {
  //         SpecificPlaceInfo _specificPlaceInfo =
  //             await tripCategories.getSpecificPlace(iterator.current.xid);

  //         if (_specificPlaceInfo.image != null &&
  //             _specificPlaceInfo.preview != null &&
  //             !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
  //           temp.add(_specificPlaceInfo);
  //           print('************');
  //           print(_specificPlaceInfo.xid);
  //           print('************');
  //           subListOfSpecifPlaces.add(_specificPlaceInfo);
  //           notifyListeners();
  //         }

  //         if (temp.length == 2) {
  //           isLoading = false;
  //           break;
  //         }
  //       }
  //     }
  //   }

  //   // controller.add(event)
  //   notifyListeners();
  //   print('temporary final length ${temp.length}');
  //   print('main list final  ${subListOfSpecifPlaces.length}');

  //   return subListOfSpecifPlaces;
  // }
}

class ShopsDataProvider extends ChangeNotifier {
  TripCategories tripCategories = TripCategories();

  bool isLoading = false;

  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<CategorizedPlaces>> getAllAvailabeData() async {
    List<CategorizedPlaces> networkPlaces =
        await tripCategories.getAllListData(CategoryTpes.shops);
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getSubList(
      List<CategorizedPlaces> categoryPlaceList) async {
    print(
        '///////////////////////////////////////////////////////////////////////////////////');
    isLoading = true;
    notifyListeners();

    print('current Index $currentIndex');
    var iterator = categoryPlaceList
        .getRange(currentIndex, categoryPlaceList.length)
        .iterator;
    print('length of iterator : ${categoryPlaceList.length}');

    List<SpecificPlaceInfo> temp = [];
    temp.clear();
    print(' tempoprary iniitial length ${temp.length}');
    print('main initial list ${subListOfSpecifPlaces.length}');
    print(' length $start');
    start = start + 2;

    notifyListeners();
    while (subListOfSpecifPlaces.length < start) {
      while (iterator.moveNext()) {
        currentIndex = currentIndex + 1;
        print(currentIndex);
        if (iterator.current.xid != null) {
          SpecificPlaceInfo _specificPlaceInfo =
              await tripCategories.getSpecificPlace(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null &&
              !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
            temp.add(_specificPlaceInfo);
            print('************');
            print(_specificPlaceInfo.xid);
            print('************');
            subListOfSpecifPlaces.add(_specificPlaceInfo);
            notifyListeners();
          }

          if (temp.length == 2) {
            isLoading = false;
            break;
          }
        }
      }
    }

    // controller.add(event)
    notifyListeners();
    print('temporary final length ${temp.length}');
    print('main list final  ${subListOfSpecifPlaces.length}');

    return subListOfSpecifPlaces;
  }
}

class TempleDataProvider extends ChangeNotifier {
  TripCategories tripCategories = TripCategories();

  bool isLoading = false;

  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<CategorizedPlaces>> getAllAvailabeData() async {
    List<CategorizedPlaces> networkPlaces =
        await tripCategories.getAllListData(CategoryTpes.religion);
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getSubList(
      List<CategorizedPlaces> categoryPlaceList) async {
    print(
        '///////////////////////////////////////////////////////////////////////////////////');
    isLoading = true;
    notifyListeners();

    print('current Index $currentIndex');
    var iterator = categoryPlaceList
        .getRange(currentIndex, categoryPlaceList.length)
        .iterator;
    print('length of iterator : ${categoryPlaceList.length}');

    List<SpecificPlaceInfo> temp = [];
    temp.clear();
    print(' tempoprary iniitial length ${temp.length}');
    print('main initial list ${subListOfSpecifPlaces.length}');
    print(' length $start');
    start = start + 2;

    notifyListeners();
    while (subListOfSpecifPlaces.length < start) {
      while (iterator.moveNext()) {
        currentIndex = currentIndex + 1;
        print(currentIndex);
        if (iterator.current.xid != null) {
          SpecificPlaceInfo _specificPlaceInfo =
              await tripCategories.getSpecificPlace(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null &&
              !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
            temp.add(_specificPlaceInfo);
            print('************');
            print(_specificPlaceInfo.xid);
            print('************');
            subListOfSpecifPlaces.add(_specificPlaceInfo);
            notifyListeners();
          }

          if (temp.length == 2) {
            isLoading = false;
            break;
          }
        }
      }
    }

    // controller.add(event)
    notifyListeners();
    print('temporary final length ${temp.length}');
    print('main list final  ${subListOfSpecifPlaces.length}');

    return subListOfSpecifPlaces;
  }
}

class NatureDataProvider extends ChangeNotifier {
  TripCategories tripCategories = TripCategories();

  bool isLoading = false;

  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<CategorizedPlaces>> getAllAvailabeData() async {
    List<CategorizedPlaces> networkPlaces =
        await tripCategories.getAllListData(CategoryTpes.natural);
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getSubList(
      List<CategorizedPlaces> categoryPlaceList) async {
    print(
        '///////////////////////////////////////////////////////////////////////////////////');
    isLoading = true;
    notifyListeners();

    print('current Index $currentIndex');
    var iterator = categoryPlaceList
        .getRange(currentIndex, categoryPlaceList.length)
        .iterator;
    print('length of iterator : ${categoryPlaceList.length}');

    List<SpecificPlaceInfo> temp = [];
    temp.clear();
    print(' tempoprary iniitial length ${temp.length}');
    print('main initial list ${subListOfSpecifPlaces.length}');
    print(' length $start');
    start = start + 2;

    notifyListeners();
    while (subListOfSpecifPlaces.length < start) {
      while (iterator.moveNext()) {
        currentIndex = currentIndex + 1;
        print(currentIndex);
        if (iterator.current.xid != null) {
          SpecificPlaceInfo _specificPlaceInfo =
              await tripCategories.getSpecificPlace(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null &&
              !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)) {
            temp.add(_specificPlaceInfo);
            print('************');
            print(_specificPlaceInfo.xid);
            print('************');
            subListOfSpecifPlaces.add(_specificPlaceInfo);
            notifyListeners();
          }

          if (temp.length == 2) {
            isLoading = false;
            break;
          }
        }
      }
    }

    // controller.add(event)
    notifyListeners();
    print('temporary final length ${temp.length}');
    print('main list final  ${subListOfSpecifPlaces.length}');

    return subListOfSpecifPlaces;
  }
}
