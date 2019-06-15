import 'package:flutter/material.dart';

import '../restaurant_manager.dart';

class RestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: RestaurantManager(),
    );
  }
}
