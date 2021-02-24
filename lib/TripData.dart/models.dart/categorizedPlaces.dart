




import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'categorizedPlaces.g.dart';


List<CategorizedPlaces> categorizedPlacesFromJson(String str) => List<CategorizedPlaces>.from(json.decode(str).map((x) => CategorizedPlaces.fromJson(x)));

String categorizedPlacesPlacesToJson(List<CategorizedPlaces> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@JsonSerializable(explicitToJson:true,nullable: true)
class CategorizedPlaces {
    CategorizedPlaces({
        this.xid,
        this.name,
        this.dist,
        this.rate,
        this.osm,
        this.wikidata,
        this.kinds,
        this.point,
    });

    String xid;
    String name;
    double dist;
    int rate;
    String osm;
    String wikidata;
    String kinds;
    Point point;

    factory CategorizedPlaces.fromJson(Map<String, dynamic> json) => _$CategorizedPlacesFromJson(json);

    Map<String, dynamic> toJson() => _$CategorizedPlacesToJson(this);
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
