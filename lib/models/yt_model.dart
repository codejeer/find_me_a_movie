// To parse this JSON data, do
//
//     final ytModel = ytModelFromJson(jsonString);

import 'dart:convert';

YtModel ytModelFromJson(String str) => YtModel.fromJson(json.decode(str));

String ytModelToJson(YtModel data) => json.encode(data.toJson());

class YtModel {
  YtModel({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.videoId,
    required this.videoUrl,
    required this.errorMessage,
  });

  String imDbId;
  String title;
  String fullTitle;
  String type;
  String year;
  String videoId;
  String videoUrl;
  String errorMessage;

  factory YtModel.fromJson(Map<String, dynamic> json) => YtModel(
        imDbId: json["imDbId"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        type: json["type"],
        year: json["year"],
        videoId: json["videoId"],
        videoUrl: json["videoUrl"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "imDbId": imDbId,
        "title": title,
        "fullTitle": fullTitle,
        "type": type,
        "year": year,
        "videoId": videoId,
        "videoUrl": videoUrl,
        "errorMessage": errorMessage,
      };
}
