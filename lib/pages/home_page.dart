import 'package:find_me_a_movie/components/components.dart';
import 'package:find_me_a_movie/pages/search.dart';
import 'package:find_me_a_movie/pages/tv.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int index = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().background,
      bottomNavigationBar: NavigationBar(
          backgroundColor: CustomColors().background,
          selectedIndex: index,
          onDestinationSelected: (currentindex) {
            setState(() {
              index = currentindex;
            });
          },
          destinations: [
            NavigationDestination(
                tooltip: "Movies",
                icon: FaIcon(
                    index == 0 ? Icons.movie_sharp : Icons.movie_outlined,
                    size: 36),
                label: "Movies"),
            NavigationDestination(
                tooltip: "Series",
                icon: FaIcon(
                    index == 1 ? Icons.live_tv : Icons.live_tv_outlined,
                    size: 36),
                label: "Series"),
            NavigationDestination(
                tooltip: "Search Page",
                icon: FaIcon(
                    index == 2
                        ? Icons.screen_search_desktop_rounded
                        : Icons.screen_search_desktop_outlined,
                    size: 36),
                label: "Search")
          ]),
      body: index == 0
          ? const Movies()
          : index == 1
              ? const TV()
              : const Search(),
    );
  }
}
