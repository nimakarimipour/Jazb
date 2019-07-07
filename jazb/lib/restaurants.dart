import 'package:flutter/material.dart';

import './pages/restaurant.dart';

class Restaurants extends StatefulWidget {
  final List<Map<String, String>> restaurants;
  Function loadMore;

  Restaurants(this.restaurants, this.loadMore);

  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  loadMore() {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      setState(() {
        widget.loadMore();
        isPerformingRequest = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildRestaurantItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => RestaurantPage(
                  widget.restaurants[index]['title'],
                  widget.restaurants[index]['image'],
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
                  child: Stack(
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      Center(
                        child: Image.network(
                          widget.restaurants[index]['image'],
                          height: 120,
                          width: 180,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
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
                    widget.restaurants[index]['title'],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    '${widget.restaurants[index]['area']} ∙ ${widget.restaurants[index]['dist']}',
                  ),
                ),
                Container(
                  child: Text(
                    '${widget.restaurants[index]['type']}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '${widget.restaurants[index]['rate']}',
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
    if (widget.restaurants.length > 0) {
      restaurantCards = ListView.builder(
        itemBuilder: _buildRestaurantItem,
        itemCount: widget.restaurants.length,
        controller: _scrollController,
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
