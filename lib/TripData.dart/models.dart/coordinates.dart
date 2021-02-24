
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable(explicitToJson:true,nullable: true)
class Coordinates{
  String name;
  double latitude;
  double longitude;
  String status;
  String country;
  Coordinates({this.latitude,this.longitude,this.name,this.status,this.country});
   factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        name: json['name'],
        latitude: json['lat'],
        longitude: json['lon'],
        status: json['status'],
        country: json['country'],
      );
  Map<String, dynamic> toJson() => {
   'name' : name,
   'lat': latitude,
   'lon': longitude,
   'status' : status,
   'country': country,
  };
  
  }



// AlarmInfo welcomeFromJson(String str) => AlarmInfo.fromJson(json.decode(str));

// String welcomeToJson(AlarmInfo data) => json.encode(data.toJson());
