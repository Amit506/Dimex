// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorizedPlaces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategorizedPlaces _$CategorizedPlacesFromJson(Map<String, dynamic> json) {
  return CategorizedPlaces(
    xid: json['xid'] as String,
    name: json['name'] as String,
    dist: (json['dist'] as num)?.toDouble(),
    rate: json['rate'] as int,
    osm: json['osm'] as String,
    wikidata: json['wikidata'] as String,
    kinds: json['kinds'] as String,
    point: json['point'] == null
        ? null
        : Point.fromJson(json['point'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategorizedPlacesToJson(CategorizedPlaces instance) =>
    <String, dynamic>{
      'xid': instance.xid,
      'name': instance.name,
      'dist': instance.dist,
      'rate': instance.rate,
      'osm': instance.osm,
      'wikidata': instance.wikidata,
      'kinds': instance.kinds,
      'point': instance.point?.toJson(),
    };

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    lon: (json['lon'] as num)?.toDouble(),
    lat: (json['lat'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
