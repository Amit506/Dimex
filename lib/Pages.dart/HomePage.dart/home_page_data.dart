import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:dimex/TripData.dart/models.dart/categorizedPlaces.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'CategoryPages.dart/category_List.dart';

Trip trip = Trip();
PlaceData placeData = PlaceData();

// 1
class TripCategories with ChangeNotifier {
  List<CategorizedPlaces> _categoryList = [];
  List<SpecificPlaceInfo> _categorySubList = [];
  int starting = 0;
  int ending = 2;
  int _currentLength = 0;

  //adding to list which are going to show on screen
  set addCategorySubList(SpecificPlaceInfo _categorySubLists) {
    _categorySubList.add(_categorySubLists);
    // print(_categorySubList.length);
    notifyListeners();
  }

//  set method for list of all data got in http request
  set categoryList(List<CategorizedPlaces> _categoryLists) {
    _categoryList = _categoryLists;
  }

//  get method for list of all data got in http request
  List<CategorizedPlaces> get allCategoryList {
    return _categoryList;
  }

  //get method for category list showing on screen
  List<SpecificPlaceInfo> get allCategorySubList {
    return _categorySubList;
  }

  int get getcurrentLength {
    return _currentLength;
  }

  set setcurrentLength(int i) {
    _currentLength = i;
    notifyListeners();
  }

// sublisting all data got in previous step
  List<CategorizedPlaces> getCategorySubList(List<CategorizedPlaces> foods) {
    List<CategorizedPlaces> _temp = foods.sublist(starting, ending);
    // print('$starting : start');
    print('$ending :end ');

    starting = starting + 2;
    ending = ending + 2;

    return _temp;
  }

// http method to get all data of specific place
  static Future<SpecificPlaceInfo> getSpecificPlace(String xid) async {
    SpecificPlaceInfo _foodInfo = await placeData.specificPlaces(xid);
    return _foodInfo;
  }

//to get  data pf list of specific place
  Future<List<SpecificPlaceInfo>> getListData(
      List<CategorizedPlaces> subFoodList, TripCategories food) async {
    List<SpecificPlaceInfo> _temp = [];

    var _iterator = subFoodList.iterator;
    // print('lenght of iterator: ${subFoodList.length}');
    while (_iterator.moveNext()) {
      if (_iterator.current.xid != null &&
          _iterator.current != null &&
          _iterator.current.name != null) {
        SpecificPlaceInfo _specificPlaceInfo =
            await TripCategories.getSpecificPlace(_iterator.current.xid);

        if (_specificPlaceInfo.xid != null &&
            _specificPlaceInfo.name != null &&
            _specificPlaceInfo.image != null) {
          // print(_specificPlaceInfo.name);
          // print(_specificPlaceInfo.xid);

          food.addCategorySubList = _specificPlaceInfo;
          _temp.add(_specificPlaceInfo);
        }
      }
    }
    print('length of temp:${_temp.length}');
    food.setcurrentLength = _temp.length;
    // notifyListeners();

    return _temp;
  }

// http request to get all data
  Future<List<CategorizedPlaces>> getCategoryList(CategoryTpes category) async {
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
              2.toString());
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

// method where we unify all previous method to fetch data and update in Scrolling
  void getListOfData(
      BuildContext context, bool isScroll, CategoryTpes category) async {
    TripCategories food = Provider.of<TripCategories>(context, listen: false);

    switch (category) {
      case CategoryTpes.foods:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.foods);
          print('length of all :${allFoodList.length}');
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            //  print('subList : ${subFoodList.length}');
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            // print('subList : ${subFoodList.length}');
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);
          }
        }
        break;
      case CategoryTpes.natural:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.natural);
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          }
        }
        break;
      case CategoryTpes.shops:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.natural);
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          }
        }
        break;
      case CategoryTpes.sport:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.natural);
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          }
        }
        break;
      case CategoryTpes.adult:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.natural);
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          }
        }
        break;
      case CategoryTpes.historic:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.natural);
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          }
        }
        break;
      case CategoryTpes.museums:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.natural);
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          }
        }
        break;
      case CategoryTpes.religion:
        {
          List<CategorizedPlaces> allFoodList =
              await food.getCategoryList(CategoryTpes.natural);
          if (isScroll == false) {
            food.categoryList = allFoodList;
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          } else {
            List<CategorizedPlaces> subFoodList =
                food.getCategorySubList(food.allCategoryList);
            List<SpecificPlaceInfo> amit =
                await food.getListData(subFoodList, food);

            // food.addCategorySubList = amit;
          }
        }
        break;
    }
  }
}

// // 2
// class Shops {
//   List<CategorizedPlaces> _shops;
//   int starting = 0;
//   int ending = 3;
//   Future<List<CategorizedPlaces>> getAllShopList() async {
//     List<CategorizedPlaces> _temp = await trip.categorizedPlaces(
//         28.6304.toString(),
//         77.2177.toString(),
//         60000.toString(),
//         500.toString(),
//         'shops,theatres_and_entertainments',
//         1.toString());

//     _shops = _temp;
//     return _shops;
//   }

//   List<CategorizedPlaces> get allShopsList {
//     return _shops;
//   }

//   Future<List<CategorizedPlaces>> getShopSubList(
//       List<CategorizedPlaces> shops) async {
//     List<CategorizedPlaces> _temp = shops.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;
//   }

//   Future<CategorizedPlaces> getSpecificPlace(String xid) async {
//     CategorizedPlaces _shopInfo = await placeData.specificPlaces(xid);
//     return _shopInfo;
//   }
// }

// // 3
// class Sport {
//   List<CategorizedPlaces> _sport;
//   int starting = 0;
//   int ending = 3;
//   Future<List<CategorizedPlaces>> getAllSportList() async {
//     List<CategorizedPlaces> _temp = await trip.categorizedPlaces(
//         28.6304.toString(),
//         77.2177.toString(),
//         60000.toString(),
//         500.toString(),
//         'sport,amusements',
//         1.toString());

//     _sport = _temp;
//     return _sport;
//   }

//   List<CategorizedPlaces> get allShopsList {
//     return _sport;
//   }

//   Future<List<CategorizedPlaces>> getShopSubList(
//       List<CategorizedPlaces> sport) async {
//     List<CategorizedPlaces> _temp = sport.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;
//   }

//   Future<CategorizedPlaces> getSpecificPlace(String xid) async {
//     CategorizedPlaces _sportInfo = await placeData.specificPlaces(xid);
//     return _sportInfo;
//   }
// }

// // 4
// class Natural {
//   List<CategorizedPlaces> _natural;
//   int starting = 0;
//   int ending = 3;
//   Future<List<CategorizedPlaces>> getAllNaturalList() async {
//     List<CategorizedPlaces> _temp = await trip.categorizedPlaces(
//         28.6304.toString(),
//         77.2177.toString(),
//         60000.toString(),
//         500.toString(),
//         'urban_environment,natural',
//         1.toString());

//     _natural = _temp;
//     return _natural;
//   }

//   List<CategorizedPlaces> get allNaturalList {
//     return _natural;
//   }

//   Future<List<CategorizedPlaces>> getNaturalSubList(
//       List<CategorizedPlaces> natural) async {
//     List<CategorizedPlaces> _temp = natural.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;
//   }

//   Future<CategorizedPlaces> getSpecificPlace(String xid) async {
//     CategorizedPlaces _naturalInfo = await placeData.specificPlaces(xid);
//     return _naturalInfo;
//   }
// }

// //
// class Party {
//   List<CategorizedPlaces> _party;
//   int starting = 0;
//   int ending = 3;
//   Future<List<CategorizedPlaces>> getAllPartyList() async {
//     List<CategorizedPlaces> _temp = await trip.categorizedPlaces(
//         28.6304.toString(),
//         77.2177.toString(),
//         60000.toString(),
//         500.toString(),
//         'sport,amusements',
//         1.toString());

//     _party = _temp;
//     return _party;
//   }

//   List<CategorizedPlaces> get allPartyList {
//     return _party;
//   }

//   Future<List<CategorizedPlaces>> getPartySubList(
//       List<CategorizedPlaces> party) async {
//     List<CategorizedPlaces> _temp = party.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;
//   }

//   Future<CategorizedPlaces> getSpecificPlace(String xid) async {
//     CategorizedPlaces _partyInfo = await placeData.specificPlaces(xid);
//     return _partyInfo;
//   }
// }

// // 6
// class Museums {
//   List<CategorizedPlaces> _museums;
//   int starting = 0;
//   int ending = 3;
//   Future<List<CategorizedPlaces>> getAllMuseumsList() async {
//     List<CategorizedPlaces> _temp = await trip.categorizedPlaces(
//         28.6304.toString(),
//         77.2177.toString(),
//         60000.toString(),
//         500.toString(),
//         'sport,amusements',
//         1.toString());

//     _museums = _temp;
//     return _museums;
//   }

//   List<CategorizedPlaces> get allMuseumsList {
//     return _museums;
//   }

//   Future<List<CategorizedPlaces>> getMuseumsSubList(
//       List<CategorizedPlaces> museums) async {
//     List<CategorizedPlaces> _temp = museums.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;
//   }

//   Future<CategorizedPlaces> getSpecificPlace(String xid) async {
//     CategorizedPlaces _museumsInfo = await placeData.specificPlaces(xid);
//     return _museumsInfo;
//   }
// }

// // 7
// class Historic {
//   List<CategorizedPlaces> _historic;
//   int starting = 0;
//   int ending = 3;
//   Future<List<CategorizedPlaces>> getAllHistoricList() async {
//     List<CategorizedPlaces> _temp = await trip.categorizedPlaces(
//         28.6304.toString(),
//         77.2177.toString(),
//         60000.toString(),
//         500.toString(),
//         'architecture,historic',
//         1.toString());

//     _historic = _temp;
//     return _historic;
//   }

//   List<CategorizedPlaces> get allHistoricList {
//     return _historic;
//   }

//   Future<List<CategorizedPlaces>> getHistoricSubList(
//       List<CategorizedPlaces> historic) async {
//     List<CategorizedPlaces> _temp = historic.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;
//   }

//   Future<CategorizedPlaces> getSpecificPlace(String xid) async {
//     CategorizedPlaces _historicInfo = await placeData.specificPlaces(xid);
//     return _historicInfo;
//   }
// }
// // 8

// class Temple {
//   List<CategorizedPlaces> _temple;
//   int starting = 0;
//   int ending = 3;
//   Future<List<CategorizedPlaces>> getAllTempleList() async {
//     List<CategorizedPlaces> _temp = await trip.categorizedPlaces(
//         28.6304.toString(),
//         77.2177.toString(),
//         60000.toString(),
//         500.toString(),
//         'religion',
//         1.toString());

//     _temple = _temp;
//     return _temple;
//   }

//   List<CategorizedPlaces> get allTempleList {
//     return _temple;
//   }

//   Future<List<CategorizedPlaces>> getTempleSubList(
//       List<CategorizedPlaces> temple) async {
//     List<CategorizedPlaces> _temp = temple.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;
//   }

//   Future<CategorizedPlaces> getSpecificPlace(String xid) async {
//     CategorizedPlaces _templeInfo = await placeData.specificPlaces(xid);
//     return _templeInfo;
//   }
// }
