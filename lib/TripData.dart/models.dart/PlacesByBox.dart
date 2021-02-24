// import 'dart:convert';

// List<PlacesByBox> placesByBoxFromJson(String str) => List<PlacesByBox>.from(json.decode(str).map((x) => PlacesByBox.fromJson(x)));

// String placesByBoxToJson(List<PlacesByBox> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class PlacesByBox {
//     PlacesByBox({
//         this.type,
//         this.id,
//         this.geometry,
//         this.properties,
//     });

//     WelcomeType type;
//     String id;
//     Geometry geometry;
//     Properties properties;

//     factory PlacesByBox.fromJson(Map<String, dynamic> json) => PlacesByBox(
//         type: welcomeTypeValues.map[json['type']],
//         id: json['id'],
//         geometry: Geometry.fromJson(json['geometry']),
//         properties: Properties.fromJson(json['properties']),
//     );

//     Map<String, dynamic> toJson() => {
//         'type': welcomeTypeValues.reverse[type],
//         'id': id,
//         'geometry': geometry.toJson(),
//         'properties': properties.toJson(),
//     };
// }

// class Geometry {
//     Geometry({
//         this.type,
//         this.coordinates,
//     });

//     GeometryType type;
//     List<double> coordinates;

//     factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
//         type: geometryTypeValues.map[json['type']],
//         coordinates: List<double>.from(json['coordinates'].map((x) => x.toDouble())),
//     );

//     Map<String, dynamic> toJson() => {
//         'type': geometryTypeValues.reverse[type],
//         'coordinates': List<dynamic>.from(coordinates.map((x) => x)),
//     };
// }

// enum GeometryType { POINT }

// final geometryTypeValues = EnumValues({
//     'Point': GeometryType.POINT
// });

// class Properties {
//     Properties({
//         this.xid,
//         this.name,
//         this.rate,
//         this.osm,
//         this.wikidata,
//         this.kinds,
//     });

//     String xid;
//     String name;
//     int rate;
//     String osm;
//     String wikidata;
//     String kinds;

//     factory Properties.fromJson(Map<String, dynamic> json) => Properties(
//         xid: json['xid'],
//         name: json['name'],
//         rate: json['rate'],
//         osm: json['osm'] != null ? json['osm']:null,
//         wikidata: json['wikidata'],
//         kinds: json['kinds'],
//     );

//     Map<String, dynamic> toJson() => {
//         'xid': xid,
//         'name': name,
//         'rate': rate,
//         'osm': osm == null ? null : osm,
//         'wikidata': wikidata,
//         'kinds': kinds,
//     };
// }

// enum WelcomeType { FEATURE }

// final welcomeTypeValues = EnumValues({
//     'Feature': WelcomeType.FEATURE
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }