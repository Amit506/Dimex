// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlacesInRadius.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesInRadius _$PlacesInRadiusFromJson(Map<String, dynamic> json) {
  return PlacesInRadius(
    xid: json['xid'] as String,
    name: json['name'] as String,
    rate: json['rate'] as int,
    wikidata: json['wikidata'] as String,
    kinds: json['kinds'] as String,
    point: json['point'] == null
        ? null
        : Point.fromJson(json['point'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlacesInRadiusToJson(PlacesInRadius instance) =>
    <String, dynamic>{
      'xid': instance.xid,
      'name': instance.name,
      'rate': instance.rate,
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
