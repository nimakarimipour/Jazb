import 'package:camera/camera.dart';
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
            child: Image.network(imageUrl),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(title),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Lorem ipsum dolor sit amet, aut adipiscing. Sed lectus nunc dolor, sem vestibulum, nonummy tellus class integer accumsan erat, sed sit, elementum nisl neque. Neque mauris in aptent. Dui ipsum eget penatibus'),
          ),
        ],
      ),
    );
  }
}
