import 'package:flutter/material.dart';

import './pages/restaurant.dart';

class Restaurants extends StatelessWidget {
  final List<Map<String, String>> restaurants;

  Restaurants(this.restaurants);

  Widget _buildRestaurantItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Hero(
            tag: 'ImgTag' + index.toString(),
            child: Image.asset(restaurants[index]['image']),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              restaurants[index]['title'],
              style: TextStyle(fontSize: 20),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => RestaurantPage(
                            restaurants[index]['title'],
                            restaurants[index]['image'],
                            'ImgTag' + index.toString()),
                      ),
                    ),
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
      restaurantCards = Container(
        child: Center(
          child: Text('Nothing to Show'),
        ),
      );
    }
    return restaurantCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildRestaurantList();
  }
}
