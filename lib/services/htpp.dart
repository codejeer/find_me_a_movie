import 'dart:convert' as convert;
import 'dart:developer';

import 'package:find_me_a_movie/api_key.dart';
import 'package:find_me_a_movie/models/model.dart';
import 'package:find_me_a_movie/models/search_model.dart';
import 'package:find_me_a_movie/models/wikipadia_model.dart';
import 'package:find_me_a_movie/models/yt_model.dart';
import 'package:http/http.dart' as http;

Future<Model> getTop250M() async {
  var response = await http
      .get(Uri.parse("https://imdb-api.com/en/API/Top250Movies/$apiKey"));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
  } else {
    log('Request failed with status: ${response.statusCode}.');
  }
  return ModelFromJson(response.body);
}

Future<Model> getTop250TV() async {
  var response = await http
      .get(Uri.parse("https://imdb-api.com/en/API/Top250TVs/$apiKey"));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
  } else {
    log('Request failed with status: ${response.statusCode}.');
  }
  return ModelFromJson(response.body);
}

Future<SearchModel> getResults(String SearchWord) async {
  var response = await http
      .get(Uri.parse("https://imdb-api.com/en/API/Search/$apiKey/$SearchWord"));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
  } else {
    log('Request failed with status: ${response.statusCode}.');
  }
  return searchModelFromJson(response.body);
}

Future<WikiModel> getWikiPedia(String id) async {
  var response = await http
      .get(Uri.parse("https://imdb-api.com/en/API/Wikipedia/$apiKey/$id"));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
  } else {
    log('Request failed with status: ${response.statusCode}.');
  }
  return wikiModelFromJson(response.body);
}

Future<YtModel> getTrailer(String id) async {
  var response = await http
      .get(Uri.parse("https://imdb-api.com/en/API/YouTubeTrailer/$apiKey/$id"));
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
  } else {
    log('Request failed with status: ${response.statusCode}.');
  }
  return ytModelFromJson(response.body);
}
