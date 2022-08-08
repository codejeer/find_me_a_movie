import 'package:find_me_a_movie/components/components.dart';
import 'package:flutter/material.dart';

import '../models/model.dart';
import '../services/htpp.dart';

class TV extends StatefulWidget {
  const TV({Key? key}) : super(key: key);

  @override
  State<TV> createState() => _MoviesState();
}

class _MoviesState extends State<TV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().background,
      appBar: AppBar(
        backgroundColor: CustomColors().background,
        title: const Text("Top 250 TV"),
      ),
      body: FutureBuilder(
        future: getTop250TV(),
        builder: (context, AsyncSnapshot<Model> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.errorMessage == null) {
              return Center(
                child: Text(snapshot.data!.errorMessage.toString()),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: List.generate(
                    snapshot.data!.items!.length,
                    (index) => CustomWidgets().Content(
                        context,
                        snapshot.data!.items![index].image,
                        snapshot.data!.items![index].title,
                        snapshot.data!.items![index].id,
                        snapshot.data!.items![index].crew),
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
