import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:flutter/cupertino.dart';

class ScrollListInfo {
  List<PlacesInRadius> _placesInRadius;
  int starting = 0;
  int ending = 3;
  Trip trip = Trip();

  Future<List<PlacesInRadius>> getPlacesInRadiusAllList() async {
    List<PlacesInRadius> _temp = await trip.nearByPlaces(28.6304.toString(),
        77.2177.toString(), 60000.toString(), 500.toString(),2.toString());
    _placesInRadius = _temp;
    return _placesInRadius;
  }

  List<PlacesInRadius> get placesRadiusAllList {
    return _placesInRadius;
  }

  Future<List<PlacesInRadius>> getSpecificPlaceList(
      List<PlacesInRadius> placesInRadius) async {
    List<PlacesInRadius> _temp = placesInRadius.sublist(starting, ending);
    starting = starting + 2;
    ending = ending + 2;

    return _temp;
  }

  Future<SpecificPlaceInfo> getSpecificPlace(String xid) async {
    PlaceData placeData = PlaceData();
    SpecificPlaceInfo _specificPlaceInfo = await placeData.specificPlaces(xid);
    return _specificPlaceInfo;
  }
}

// class ScrollListInfo {
//   PlaceData placeData = PlaceData();
//   int starting = 0;
//   int ending = 3;
//   static final ScrollListInfo instance = ScrollListInfo._privateConstructor();

//   List<PlacesInRadius> _placesInRadius;
//   ScrollListInfo._privateConstructor();

//   factory ScrollListInfo(
//     List<PlacesInRadius> _placesInRadius,

//   ) {
//     instance._placesInRadius = _placesInRadius;

//     return instance;
//   }
//   List<PlacesInRadius> getPlacesInRadius() {
//     return _placesInRadius;
//   }
//   // List<SpecificPlaceInfo> getListSpecificPlace(){
//   //    return _specificPlaceInfoList;
//   // }

//   Future<List<PlacesInRadius>> getSpecificPlaceInfo() async {

//     List<PlacesInRadius> _temp = _placesInRadius.sublist(starting, ending);
//     starting = starting + 4;
//     ending = ending + 4;

//     return _temp;

//   }

//   Future<SpecificPlaceInfo> getAmit(String xid)async{

//          SpecificPlaceInfo _specificPlaceInfo =
//           await placeData.specificPlaces(xid);
//           return _specificPlaceInfo;
//   }
// }
