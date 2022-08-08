import 'package:flutter/material.dart';

import '../pages/details.dart';

class CustomColors {
  Color background = const Color.fromRGBO(8, 13, 43, 1);
  Color primary = const Color.fromRGBO(255, 255, 255, 1);
}

class CustomWidgets {
  Widget Content(
    BuildContext context,
    String imageUrl,
    String title,
    String id,
    String crew,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              id: id,
              imageUrl: imageUrl,
              title: title,
              crew: crew,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28.0),
              child: Image.network(
                imageUrl,
                height: 150.0,
                width: 100.0,
              ),
            ),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
