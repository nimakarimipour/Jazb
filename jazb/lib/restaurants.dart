import 'package:flutter/material.dart';

import './pages/restaurant.dart';

class Restaurants extends StatelessWidget {
  final List<Map<String, String>> restaurants;
  final Function deleteRestaurant;

  Restaurants(this.restaurants, {this.deleteRestaurant}) {}

  Widget _buildRestaurantItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'ImgTag' + index.toString(),
            child: Image.asset(restaurants[index]['image']),
          ),
          Text(restaurants[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => RestaurantPage(
                            restaurants[index]['title'],
                            restaurants[index]['image'],
                            'ImgTag' + index.toString()),
                      ),
                    ).then((bool value) {
                      if (value) {
                        deleteRestaurant(index);
                      }
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRestaurantList() {
    Widget restaurantCards;
    if (restaurants.length > 0) {
      restaurantCards = ListView.builder(
        itemBuilder: _buildRestaurantItem,
        itemCount: restaurants.length,
      );
    } else {
      restaurantCards = Container();
    }
    return restaurantCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildRestaurantList();
  }
}
