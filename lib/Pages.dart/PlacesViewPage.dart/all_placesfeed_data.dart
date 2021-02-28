import 'package:dimex/TripData.dart/Trip/data.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Trip trip = Trip();
PlaceData placeData = PlaceData();

class AllPlacesFeedList extends ChangeNotifier{



  bool isLoading = false;
  List<SpecificPlaceInfo> subListOfSpecifPlaces = [];

  int currentIndex = 0;
  int length = 0;
  int start = 0;
  Future<List<PlacesInRadius>> getAllAvailabeData() async {
    List<PlacesInRadius> networkPlaces = await trip.nearByPlaces(28.6304.toString(),
        77.2177.toString(), 60000.toString(), 500.toString(), 2.toString());
    length = networkPlaces.length;
    notifyListeners();
    return networkPlaces;
  }

  Future<List<SpecificPlaceInfo>> getSpecifcPlaceSubList(
      List<PlacesInRadius> categoryPlaceList) async {
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
              await placeData.specificPlaces(iterator.current.xid);

          if (_specificPlaceInfo.image != null &&
              _specificPlaceInfo.preview != null && !subListOfSpecifPlaces.contains(_specificPlaceInfo.xid)
             ) {
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






