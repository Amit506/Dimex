import 'dart:async';
import 'dart:math';

import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/categorizedPlaces.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'home_page_data.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dimex/TripData.dart/Trip/data.dart';


Trip _trip = Trip();

class WheelScrollData with ChangeNotifier {

  List<PlacesInRadius> _allPlaces;
  List<SpecificPlaceInfo> _subPlaces = [];




  // set addSubPlaces(SpecificPlaceInfo _temp) {
  //   _subPlaces.add(_temp);
  // //  _streamController.sink.add(_subPlaces);
  //   // notifyListeners();
  // }

  // set addAllPlaces(List<PlacesInRadius> _temp) {
  //   _allPlaces = _temp;
  // }

  // List<SpecificPlaceInfo> get subPlaces {
  //   return _subPlaces;
  // }

  // List<PlacesInRadius> get allPlaces {
  //   return _allPlaces;
  // }

  List<PlacesInRadius> randomSubList(List<PlacesInRadius> _allList) {
    Random random = Random();

    int randomIndex = random.nextInt(_allList.length - 9);

    Iterable<PlacesInRadius> _temp =
        _allList.getRange(randomIndex, randomIndex + 9);
    return _temp.toList();
  }

  static Future<SpecificPlaceInfo> getSpecificPlace(String xid) async {
    SpecificPlaceInfo _foodInfo = await placeData.specificPlaces(xid);
    return _foodInfo;
  }

  Stream<List<SpecificPlaceInfo>> getMostRatedPlaces() async* {
    print('started');
    List<SpecificPlaceInfo> _temp = [];
    WheelScrollData _wheekScrollData = WheelScrollData();
    List<PlacesInRadius> _ratedPlaces = await _trip.nearByPlaces(
        28.6304.toString(),
        77.2177.toString(),
        60000.toString(),
        500.toString(),
        2.toString());

    List<PlacesInRadius> randomlist = randomSubList(_ratedPlaces);
    var _iterator = randomlist.iterator;
    while (_iterator.moveNext()) {
      if (_iterator.current.xid != null &&
          _iterator.current != null &&
          _iterator.current.name != null) {
        SpecificPlaceInfo _specificPlaceInfo =
            await WheelScrollData.getSpecificPlace(_iterator.current.xid);
        if(_specificPlaceInfo.preview!=null){
          // _wheekScrollData.addSubPlaces = _specificPlaceInfo;
        _temp.add(_specificPlaceInfo);
        yield _temp;
        }
        
      }
    }
  }
  
}
