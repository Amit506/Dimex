import 'package:http/http.dart' as http;
import 'dataGeocode.dart';
import 'modelsGeocode.dart/ReverseGeoInfo.dart';
const baseForStaticMap ='https://open.mapquestapi.com/staticmap/v5/map';


class StaticMap{


Future getMap()async{

try{

final response = await http.get('https://open.mapquestapi.com/staticmap/v5/map?locations=New+York,NY||Buffalo,NY||Rochester,NY&size=600,400@2x&key=$apikeyGeocode&banner=Large+Cities+in+New+York');
print(response.body);

}catch(e){
  print(e.toString());
}

}

}