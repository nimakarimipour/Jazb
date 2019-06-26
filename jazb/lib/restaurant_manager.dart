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

  @override
  void initState() {
    super.initState();
    Random random = new Random();
    for(var i = 0; i < 10; i++){
      _restaurants.add({
          'title': 'Restaurant Name',
          'image': 'assets/restaurant_interior_'+ random.nextInt(3).toString() + '.jpg'
        });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Restaurants(_restaurants);
  }
}
