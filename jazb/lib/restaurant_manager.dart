import 'package:flutter/material.dart';

import './restaurants.dart';
import './restaurant_control.dart';

class RestaurantManager extends StatefulWidget {
  final Map<String, String> startingRestaurant;

  RestaurantManager({this.startingRestaurant}) {

  }

  @override
  State<StatefulWidget> createState() {

    return _RestaurantManagerState();
  }
}

class _RestaurantManagerState extends State<RestaurantManager> {
  List<Map<String, String>> _restaurants = [];

  @override
  void initState() {
    if (widget.startingRestaurant != null) {
      _restaurants.add(widget.startingRestaurant);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(RestaurantManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _addRestaurant(Map<String, String> restaurant) {
    setState(() {
      _restaurants.add(restaurant);
    });
  }

  void _deleteRestaurant(int index) {
    setState(() {
      _restaurants.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RestaurantControl(_addRestaurant),
        ),
        Expanded(child: Restaurants(_restaurants, deleteRestaurant: _deleteRestaurant))
      ],
    );
  }
}
