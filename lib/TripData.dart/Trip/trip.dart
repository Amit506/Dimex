





import 'data.dart';
import 'dataGeocode.dart';
// import 'models.dart/PlacesByBox.dart';
import 'modelsGeocode.dart/ReverseGeoInfo.dart';





void main(List<String> arguments) async {
 
  Trip trip = Trip();
var temp = await trip.nearByPlaces(28.6304.toString(), 77.2177.toString(), 60000.toString(),500.toString(),2.toString() );
  print(temp);
  


}
