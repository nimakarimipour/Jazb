import 'package:flutter/material.dart';
import 'dart:math';

class RestaurantControl extends StatelessWidget {
  final Function addRestaurant;
  Random random;

  RestaurantControl(this.addRestaurant){
    random = new Random();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addRestaurant({
          'title': 'Narenjestan',
          'image': 'assets/restaurant_interior_'+ random.nextInt(3).toString() + '.jpg'
        });
      },
      child: Text('Add Restaurant'),
    );
  }
}
