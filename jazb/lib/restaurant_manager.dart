import 'package:flutter/material.dart';

import './restaurants.dart';
import 'dart:math';

class RestaurantManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RestaurantManagerState();
  }
}

class _RestaurantManagerState extends State<RestaurantManager> {
  List<Map<String, String>> _restaurants = [];

  List<String> imageLinks = [
    "https://i.ibb.co/2sj2VgQ/restaurant-interior-0.jpg",
    "https://i.ibb.co/P6s7GYs/restaurant-interior-1.jpg",
    "https://i.ibb.co/HF0mfYn/restaurant-interior-2.jpg",
    "https://i.ibb.co/RS5gRfH/restaurant-interior-3.jpg",
    "https://i.ibb.co/gvK2Vms/restaurant-interior-4.jpg]",
  ];

  @override
  void initState() {
    super.initState();
    Random random = new Random();
    for (var i = 0; i < 10; i++) {
      _restaurants.add({
        'title': 'Restaurant Name',
        'image': imageLinks[random.nextInt(imageLinks.length)],
        'rate': "9.7",
        'area': "District 10",
        'dist': "1.7 Miles Away",
        'type': "Italian",
      });
    }
  }

  loadMore() {
    Random random = new Random();
    setState(() {
      _restaurants.add({
        'title': 'Restaurant Name',
        'image': imageLinks[random.nextInt(imageLinks.length)],
        'rate': "9.7",
        'area': "District 10",
        'dist': "1.7 Miles Away",
        'type': "Italian",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Restaurants(_restaurants, loadMore);
  }
}
