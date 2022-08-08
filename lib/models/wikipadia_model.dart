// To parse this JSON data, do
//
//     final wikiModel = wikiModelFromJson(jsonString);

import 'dart:convert';

WikiModel wikiModelFromJson(String str) => WikiModel.fromJson(json.decode(str));

String wikiModelToJson(WikiModel data) => json.encode(data.toJson());

class WikiModel {
  WikiModel({
    required this.imDbId,
    required this.title,
    required this.fullTitle,
    required this.type,
    required this.year,
    required this.language,
    required this.titleInLanguage,
    required this.url,
    required this.plotShort,
    required this.plotFull,
    required this.errorMessage,
  });

  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? language;
  String? titleInLanguage;
  String? url;
  Plot? plotShort;
  Plot? plotFull;
  String? errorMessage;

  factory WikiModel.fromJson(Map<String, dynamic> json) => WikiModel(
        imDbId: json["imDbId"],
        title: json["title"],
        fullTitle: json["fullTitle"],
        type: json["type"],
        year: json["year"],
        language: json["language"],
        titleInLanguage: json["titleInLanguage"],
        url: json["url"],
        plotShort:
            json["plotShort"] == null ? null : Plot.fromJson(json["plotShort"]),
        plotFull:
            json["plotFull"] == null ? null : Plot.fromJson(json["plotFull"]),
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "imDbId": imDbId,
        "title": title,
        "fullTitle": fullTitle,
        "type": type,
        "year": year,
        "language": language,
        "titleInLanguage": titleInLanguage,
        "url": url,
        "plotShort": plotShort == null ? null : plotShort?.toJson(),
        "plotFull": plotFull == null ? null : plotFull?.toJson(),
        "errorMessage": errorMessage,
      };
}

class Plot {
  Plot({
    required this.plainText,
    required this.html,
  });

  String plainText;
  String html;

  factory Plot.fromJson(Map<String, dynamic> json) => Plot(
        plainText: json["plainText"],
        html: json["html"],
      );

  Map<String, dynamic> toJson() => {
        "plainText": plainText,
        "html": html,
      };
}
