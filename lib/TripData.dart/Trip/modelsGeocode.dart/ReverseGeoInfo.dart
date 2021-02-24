import 'dart:convert';

GeoInfo geoInfoFromJson(String str) => GeoInfo.fromJson(json.decode(str));

String geoInfoToJson(GeoInfo data) => json.encode(data.toJson());

class GeoInfo {
    GeoInfo({
      
        
        this.results,
    });

    

    List<Result> results;

    factory GeoInfo.fromJson(Map<String, dynamic> json) => GeoInfo(

       
        results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
       
        
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
    };
}



class Result {
    Result({
     
        this.locations,
    });

    List<Location> locations;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
    
        locations: List<Location>.from(json['locations'].map((x) => Location.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
    
        'locations': List<dynamic>.from(locations.map((x) => x.toJson())),
    };
}

class Location {
    Location({
        this.street,
        this.adminArea6,
        this.adminArea6Type,
        this.adminArea5,
        this.adminArea5Type,
        this.adminArea4,
        this.adminArea4Type,
        this.adminArea3,
        this.adminArea3Type,
        this.adminArea1,
        this.adminArea1Type,
        this.postalCode,
        this.geocodeQualityCode,
        this.geocodeQuality,
        this.dragPoint,
        this.sideOfStreet,
        this.linkId,
        this.unknownInput,
        this.type,
        this.latLng,
        this.displayLatLng,
        this.mapUrl,
    });

    String street;
    String adminArea6;
    String adminArea6Type;
    String adminArea5;
    String adminArea5Type;
    String adminArea4;
    String adminArea4Type;
    String adminArea3;
    String adminArea3Type;
    String adminArea1;
    String adminArea1Type;
    String postalCode;
    String geocodeQualityCode;
    String geocodeQuality;
    bool dragPoint;
    String sideOfStreet;
    String linkId;
    String unknownInput;
    String type;
    LatLng latLng;
    LatLng displayLatLng;
    String mapUrl;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json['street'],
        adminArea6: json['adminArea6'],
        adminArea6Type: json['adminArea6Type'],
        adminArea5: json['adminArea5'],
        adminArea5Type: json['adminArea5Type'],
        adminArea4: json['adminArea4'],
        adminArea4Type: json['adminArea4Type'],
        adminArea3: json['adminArea3'],
        adminArea3Type: json['adminArea3Type'],
        adminArea1: json['adminArea1'],
        adminArea1Type: json['adminArea1Type'],
        postalCode: json['postalCode'],
        geocodeQualityCode: json['geocodeQualityCode'],
        geocodeQuality: json['geocodeQuality'],
        dragPoint: json['dragPoint'],
        sideOfStreet: json['sideOfStreet'],
        linkId: json['linkId'],
        unknownInput: json['unknownInput'],
        type: json['type'],
        latLng: LatLng.fromJson(json['latLng']),
        displayLatLng: LatLng.fromJson(json['displayLatLng']),
        mapUrl: json['mapUrl'],
    );

    Map<String, dynamic> toJson() => {
        'street': street,
        'adminArea6': adminArea6,
        'adminArea6Type': adminArea6Type,
        'adminArea5': adminArea5,
        'adminArea5Type': adminArea5Type,
        'adminArea4': adminArea4,
        'adminArea4Type': adminArea4Type,
        'adminArea3': adminArea3,
        'adminArea3Type': adminArea3Type,
        'adminArea1': adminArea1,
        'adminArea1Type': adminArea1Type,
        'postalCode': postalCode,
        'geocodeQualityCode': geocodeQualityCode,
        'geocodeQuality': geocodeQuality,
        'dragPoint': dragPoint,
        'sideOfStreet': sideOfStreet,
        'linkId': linkId,
        'unknownInput': unknownInput,
        'type': type,
        'latLng': latLng.toJson(),
        'displayLatLng': displayLatLng.toJson(),
        'mapUrl': mapUrl,
    };
}

class LatLng {
    LatLng({
        this.lat,
        this.lng,
    });

    double lat;
    double lng;

    factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        lat: json['lat'].toDouble(),
        lng: json['lng'].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
    };
}
