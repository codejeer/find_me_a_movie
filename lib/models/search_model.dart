// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.searchType,
    required this.expression,
    required this.results,
    required this.errorMessage,
  });

  Type? searchType;
  String? expression;
  List<Result>? results;
  String? errorMessage;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        searchType: typeValues.map![json["searchType"]],
        expression: json["expression"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "searchType": typeValues.reverse![searchType],
        "expression": expression,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "errorMessage": errorMessage,
      };
}

class Result {
  Result({
    required this.id,
    required this.resultType,
    required this.image,
    required this.title,
    required this.description,
  });

  String? id;
  Type? resultType;
  String? image;
  String? title;
  String? description;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        resultType: typeValues.map![json["resultType"]],
        image: json["image"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "resultType": typeValues.reverse![resultType],
        "image": image,
        "title": title,
        "description": description,
      };
}

enum Type { TITLE }

final typeValues = EnumValues({"Title": Type.TITLE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}
