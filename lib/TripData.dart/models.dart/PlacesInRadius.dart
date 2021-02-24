

import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'PlacesInRadius.g.dart';

List<PlacesInRadius> placesInRadiusFromJson(String str) => List<PlacesInRadius>.from(json.decode(str).map((x) => PlacesInRadius.fromJson(x)));

String placesInRadiusToJson(List<PlacesInRadius> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@JsonSerializable(explicitToJson:true,nullable: true)
class PlacesInRadius {
    PlacesInRadius({
        this.xid,
        this.name,
        this.rate,
        this.wikidata,
        this.kinds,
        this.point,
    });

    String xid;
    String name;
 
    int rate;
    String wikidata;
    String kinds;
    Point point;

    factory PlacesInRadius.fromJson(Map<String, dynamic> json) => _$PlacesInRadiusFromJson(json);

    Map<String, dynamic> toJson() => _$PlacesInRadiusToJson(this);
}
@JsonSerializable(explicitToJson:true,nullable: true)
class Point {
    Point({
        this.lon,
        this.lat,
    });

    double lon;
    double lat;

    factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
    Map<String, dynamic> toJson() => _$PointToJson(this);
}
