import 'package:find_me_a_movie/components/components.dart';
import 'package:find_me_a_movie/services/htpp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/wikipadia_model.dart';
import '../models/yt_model.dart';

class DetailsPage extends StatelessWidget {
  String id;
  String imageUrl;
  String title;
  String crew;

  DetailsPage({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.crew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(url) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      backgroundColor: CustomColors().background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors().background,
      ),
      body: FutureBuilder(
        future: getTrailer(id),
        builder: (context, AsyncSnapshot<YtModel> snapshot1) {
          if (snapshot1.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: FutureBuilder(
                  future: getWikiPedia(id),
                  builder: (context, AsyncSnapshot<WikiModel> snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Hero(
                                tag: id,
                                child: Image.network(
                                  imageUrl,
                                  scale: 0.9,
                                ),
                              ),
                              Text(
                                snapshot.data!.title.toString(),
                                style: const TextStyle(fontSize: 25),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Divider(
                                  color: Colors.white,
                                  height: 5,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          10,
                                      child: TextButton(
                                        onPressed: () {
                                          _launchUrl(snapshot1.data!.videoUrl
                                              .toString());
                                        },
                                        child: Column(
                                          children: const [
                                            Icon(Icons.live_tv),
                                            Text("Watch Trailer")
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          10,
                                      child: TextButton(
                                        onPressed: () {
                                          _launchUrl(
                                              snapshot.data!.url.toString());
                                        },
                                        child: Column(
                                          children: const [
                                            Icon(Icons.open_in_browser),
                                            Text("Open in Wikipedia")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text('Crew: $crew'),
                              ),
                              Text(snapshot.data!.plotShort!.plainText
                                  .toString())
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            );
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
