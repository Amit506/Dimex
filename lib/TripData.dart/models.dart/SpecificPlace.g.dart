// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecificPlace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecificPlaceInfo _$SpecificPlaceInfoFromJson(Map<String, dynamic> json) {
  return SpecificPlaceInfo(
    xid: json['xid'] as String,
    name: json['name'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    rate: json['rate'] as String,
    wikidata: json['wikidata'] as String,
    kinds: json['kinds'] as String,
    sources: json['sources'] == null
        ? null
        : Sources.fromJson(json['sources'] as Map<String, dynamic>),
    otm: json['otm'] as String,
    wikipedia: json['wikipedia'] as String,
    image: json['image'] as String,
    preview: json['preview'] == null
        ? null
        : Preview.fromJson(json['preview'] as Map<String, dynamic>),
    wikipediaExtracts: json['wikipediaExtracts'] == null
        ? null
        : WikipediaExtracts.fromJson(
            json['wikipediaExtracts'] as Map<String, dynamic>),
    point: json['point'] == null
        ? null
        : Point.fromJson(json['point'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SpecificPlaceInfoToJson(SpecificPlaceInfo instance) =>
    <String, dynamic>{
      'xid': instance.xid,
      'name': instance.name,
      'address': instance.address?.toJson(),
      'rate': instance.rate,
      'wikidata': instance.wikidata,
      'kinds': instance.kinds,
      'sources': instance.sources?.toJson(),
      'otm': instance.otm,
      'wikipedia': instance.wikipedia,
      'image': instance.image,
      'preview': instance.preview?.toJson(),
      'wikipediaExtracts': instance.wikipediaExtracts?.toJson(),
      'point': instance.point?.toJson(),
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    city: json['city'] as String,
    road: json['road'] as String,
    state: json['state'] as String,
    suburb: json['suburb'] as String,
    country: json['country'] as String,
    postcode: json['postcode'] as String,
    countryCode: json['countryCode'] as String,
    neighbourhood: json['neighbourhood'] as String,
    stateDistrict: json['stateDistrict'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'road': instance.road,
      'state': instance.state,
      'suburb': instance.suburb,
      'country': instance.country,
      'postcode': instance.postcode,
      'countryCode': instance.countryCode,
      'neighbourhood': instance.neighbourhood,
      'stateDistrict': instance.stateDistrict,
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

Preview _$PreviewFromJson(Map<String, dynamic> json) {
  return Preview(
    source: json['source'] as String,
    height: json['height'] as int,
    width: json['width'] as int,
  );
}

Map<String, dynamic> _$PreviewToJson(Preview instance) => <String, dynamic>{
      'source': instance.source,
      'height': instance.height,
      'width': instance.width,
    };

Sources _$SourcesFromJson(Map<String, dynamic> json) {
  return Sources(
    geometry: json['geometry'] as String,
    attributes: (json['attributes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'geometry': instance.geometry,
      'attributes': instance.attributes,
    };

WikipediaExtracts _$WikipediaExtractsFromJson(Map<String, dynamic> json) {
  return WikipediaExtracts(
    title: json['title'] as String,
    text: json['text'] as String,
    html: json['html'] as String,
  );
}

Map<String, dynamic> _$WikipediaExtractsToJson(WikipediaExtracts instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'html': instance.html,
    };
