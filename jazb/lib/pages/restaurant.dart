import 'dart:async';

import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String imgTag;

  RestaurantPage(this.title, this.imageUrl, this.imgTag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: imgTag,
            child: Image.asset(imageUrl),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(title),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
                'Lorem ipsum dolor sit amet, nec eleifend aliquam dolor elit lorem volutpat, ut ligula a, ac platea, conubia sagittis donec, tincidunt ornare placerat suspendisse erat pellentesque metus.'),
          ),
        ],
      ),
    );
  }
}
