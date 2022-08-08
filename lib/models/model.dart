// To parse this JSON data, do
//
//     final Model = ModelFromJson(jsonString);

import 'dart:convert';

Model ModelFromJson(String str) => Model.fromJson(json.decode(str));

String ModelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    required this.items,
    required this.errorMessage,
  });

  List<Item>? items;
  String? errorMessage;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}

class Item {
  Item({
    required this.id,
    required this.rank,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.crew,
    required this.imDbRating,
    required this.imDbRatingCount,
  });

  String id;
  String rank;
  String title;
  String fullTitle;
  String year;
  String image;
  String crew;
  String imDbRating;
  String imDbRatingCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        rank: json["rank"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        year: json["year"],
        image: json["image"],
        crew: json["crew"],
        imDbRating: json["imDbRating"],
        imDbRatingCount: json["imDbRatingCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "title": title,
        "fullTitle": fullTitle,
        "year": year,
        "image": image,
        "crew": crew,
        "imDbRating": imDbRating,
        "imDbRatingCount": imDbRatingCount,
      };
}
