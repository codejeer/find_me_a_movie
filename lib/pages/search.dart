import 'package:find_me_a_movie/components/components.dart';
import 'package:find_me_a_movie/models/search_model.dart';
import 'package:find_me_a_movie/services/htpp.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String value = "!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().background,
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            child: TextField(
              onSubmitted: (data) {
                value = data;
                setState(() {});
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        backgroundColor: CustomColors().background,
      ),
      body: FutureBuilder(
        future: getResults(value),
        builder: (context, AsyncSnapshot<SearchModel> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data!.results!.length,
                  (index) => CustomWidgets().Content(
                      context,
                      snapshot.data!.results![index].image.toString(),
                      snapshot.data!.results![index].title.toString(),
                      snapshot.data!.results![index].id.toString(),
                      ""),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
