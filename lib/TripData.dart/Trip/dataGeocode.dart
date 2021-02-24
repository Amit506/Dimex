


import 'package:http/http.dart' as http;

import 'modelsGeocode.dart/ReverseGeoInfo.dart';


const apikeyGeocode ='wn2TJasomihvBrqGh0IGPccKV5X2TJGG';

const baseForReverseGeocodin ='http://open.mapquestapi.com/geocoding/v1/reverse';
const baseForForwardGeocodin ='http://open.mapquestapi.com/geocoding/v1/address';
class Geocode{



Future<GeoInfo> getAdress(String lat, String lon)async{

try{
 

final response = await http.get('$baseForReverseGeocodin?key=$apikeyGeocode&location=$lat,$lon');

if(response.statusCode==200){
  print(response.body);
  final reverseGeocode = geoInfoFromJson(response.body);

  print(reverseGeocode);
  return reverseGeocode;
}else{
  print(response.statusCode);
  return null;
}

}catch( e){
  print(e.toString());
  return null;
}

}


Future getlatlon(String location)async{

try{
 

final response = await http.get('$baseForForwardGeocodin?key=$apikeyGeocode&location=$location');

if(response.statusCode==200){
  print(response.body);
  final reverseGeocode = geoInfoFromJson(response.body);

  print(reverseGeocode);
  return reverseGeocode;
}else{
  print(response.statusCode);
  return null;
}

}catch( e){
  print(e.toString());
  return null;
}

}

}