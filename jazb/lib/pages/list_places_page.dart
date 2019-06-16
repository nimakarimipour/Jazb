import 'package:flutter/material.dart';

import '../restaurant_manager.dart';

class ListPlacesPage extends StatelessWidget {
  final String type;

  ListPlacesPage(this.type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type),
      ),
      body: RestaurantManager(),
    );
  }
}
