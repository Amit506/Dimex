import 'package:http/http.dart' as http;
import 'package:dimex/TripData.dart/models.dart/PlacesInRadius.dart';
// import 'package:dimex/TripData.dart/models.dart/SearchPlaces.dart';
import 'package:dimex/TripData.dart/models.dart/coordinates.dart';
import 'dart:convert';
import 'package:dimex/TripData.dart/models.dart/SpecificPlace.dart';
// import 'package:dimex/TripData.dart/models.dart/historicPlaces.dart';
import 'package:dimex/TripData.dart/models.dart/PlacesByBox.dart';
import 'package:dimex/TripData.dart/models.dart/categorizedPlaces.dart';

const apiKeyy = '5ae2e3f221c38a28845f05b6c6ef13bd385fdb67317c644c8c3ec2bb';
const String basUrl = 'https://api.opentripmap.com/0.1/en';

class Trip {
  Future<Coordinates> geoGraphicCoordinates(String place) async {
    try {
      final response =
          await http.get('$basUrl/places/geoname?name=$place&apikey=$apiKeyy');
      final coordinatesInfo = jsonDecode(response.body);
      var coordinates = Coordinates.fromJson(coordinatesInfo);

      return coordinates;
    } catch (e) {
      return e.cast<Coordinates>();
    }
  }

  Future<List<PlacesInRadius>> nearByPlaces(
      String lat, String lon, String radiusInmeter, String limit,String rate) async {
    try {
      final response = await http.get(
          '$basUrl/places/radius?radius=$radiusInmeter&lon=$lon&lat=$lat&rate=$rate&format=json&limit=$limit&apikey=$apiKeyy');
      final placesInRadius = placesInRadiusFromJson(response.body);
      return placesInRadius;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

Future<List<CategorizedPlaces>> categorizedPlaces(String lat,String lon, String radiusInmeter,String limit,String kind,String rate) async {
    try {
      final response = await http.get(
          '$basUrl/places/radius?radius=$radiusInmeter&lon=$lon&lat=$lat&kinds=$kind&rate=$rate&format=json&limit=$limit&apikey=$apiKeyy');

      final categorizePlaces = categorizedPlacesFromJson(response.body);
      return categorizePlaces;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  Future<List<SearchPlaces>> searchPlaces(String lat,String lon, String radiusInmeter,String limit,String name) async {
//     try {
//       final response = await http.get(
//           '$basUrl/places/autosuggest?name=$name&radius=$radiusInmeter&lon=$lon&lat=$lat&apikey=$apiKeyy');
//       var data = jsonDecode(response.body);
//       var jsonencode = jsonEncode(data['features']);
//       final searchedplaces = searchPlacesFromJson(jsonencode);
//       return searchedplaces;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
// //   }
//    Future<List<PlacesByBox>> placesByBox(String lat_min,String lat_max,String lon_min,String lon_max,String limit) async {
//     try {
//       final response = await http.get(
//         // bbox?lon_min=77.215802&lon_max=77.223362&lat_min=28.589864&lat_max=28.597062&kinds=historic&limit=5&apikey
//           '$basUrl/places/bbox?lon_min=$lon_min&lon_max=$lon_max&lat_min=$lat_min&lat_max=$lat_max&limit=$limit&apikey=$apiKeyy');
//       var data = jsonDecode(response.body);
//       var jsonencode = jsonEncode(data['features']);
//       final boxPlaces = placesByBoxFromJson(jsonencode);
//       return boxPlaces;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

}

class PlaceData {
  Future specificPlaces(String xid) async {
    try {
      final response =
          await http.get('$basUrl/places/xid/$xid?apikey=$apiKeyy');

      final specificPlaces = specificPlacesFromJson(response.body);

      return specificPlaces;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
