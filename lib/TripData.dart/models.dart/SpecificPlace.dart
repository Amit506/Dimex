import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'SpecificPlace.g.dart';

SpecificPlaceInfo specificPlacesFromJson(String str) => SpecificPlaceInfo.fromJson(json.decode(str));

String specificPlacesToJson(SpecificPlaceInfo data) => json.encode(data.toJson());


@JsonSerializable(explicitToJson:true,nullable: true)
class SpecificPlaceInfo {
    SpecificPlaceInfo({
        this.xid,
        this.name,
        this.address,
        this.rate,
        this.wikidata,
        this.kinds,
        this.sources,
        this.otm,
        this.wikipedia,
        this.image,
        this.preview,
        this.wikipediaExtracts,
        this.point,
    });

    String xid;
    String name;
    Address address;
    String rate;
    String wikidata;
    String kinds;
    Sources sources;
    String otm;
    String wikipedia;
    String image;
    Preview preview;
    WikipediaExtracts wikipediaExtracts;
    Point point;

    factory SpecificPlaceInfo.fromJson(Map<String, dynamic> json) => _$SpecificPlaceInfoFromJson(json);

    Map<String, dynamic> toJson() => _$SpecificPlaceInfoToJson(this);
}
@JsonSerializable(explicitToJson:true,nullable: true)
class Address {
    Address({
        this.city,
        this.road,
        this.state,
        this.suburb,
        this.country,
        this.postcode,
        this.countryCode,
        this.neighbourhood,
        this.stateDistrict,
    });
  
    String city;
    String road;
    String state;
    String suburb;
    String country;
    String postcode;
    String countryCode;
    String neighbourhood;
    String stateDistrict;

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

    Map<String, dynamic> toJson() => _$AddressToJson(this);
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

@JsonSerializable(explicitToJson:true,nullable: true)
class Preview {
    Preview({
        this.source,
        this.height,
        this.width,
    });

    String source;
    int height;
    int width;

    factory Preview.fromJson(Map<String, dynamic> json) => _$PreviewFromJson(json);

    Map<String, dynamic> toJson() => _$PreviewToJson(this);
}
@JsonSerializable(explicitToJson:true,nullable: true)
class Sources {
    Sources({
        this.geometry,
        this.attributes,
    });

    String geometry;
    List<String> attributes;

    factory Sources.fromJson(Map<String, dynamic> json) => _$SourcesFromJson(json);

    Map<String, dynamic> toJson() => _$SourcesToJson(this);
}
@JsonSerializable(explicitToJson:true,nullable: true)
class WikipediaExtracts {
    WikipediaExtracts({
        this.title,
        this.text,
        this.html,
    });

    String title;
    String text;
    String html;

    factory WikipediaExtracts.fromJson(Map<String, dynamic> json) => _$WikipediaExtractsFromJson(json);

    Map<String, dynamic> toJson() => _$WikipediaExtractsToJson(this);
}
