import 'package:flutter/material.dart';

import './pages/restaurant.dart';

class Restaurants extends StatelessWidget {
  final List<Map<String, String>> restaurants;

  Restaurants(this.restaurants);

  Widget _buildRestaurantItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => RestaurantPage(
                  restaurants[index]['title'],
                  restaurants[index]['image'],
                  'ImgTag' + index.toString()),
            ),
          ),
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Hero(
                tag: 'ImgTag' + index.toString(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    restaurants[index]['image'],
                    height: 120,
                    width: 180,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    restaurants[index]['title'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    'District 10 ∙ 1.7 Mile Away',
                  ),
                ),
                Container(
                  child: Text(
                    'Italian',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '9.7',
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
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
