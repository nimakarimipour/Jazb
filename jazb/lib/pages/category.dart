import 'package:flutter/material.dart';
import 'package:jazb/pages/list_places_page.dart';

class CategoryPage extends StatelessWidget {
  final List<Map<String, String>> _infos = [
    {'img': 'assets/restaurant_category.jpg', 'name': 'Restaurants'},
    {'img': 'assets/groccery_category.jpg', 'name': 'Grocceries'},
    {'img': 'assets/bar_category.jpg', 'name': 'Bars'},
  ];

  Widget _categoryItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ListPlacesPage(_infos[index]['name'])));
      },
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(_infos[index]['img']),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                _infos[index]['name'],
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: ListView.builder(
        itemBuilder: _categoryItemBuilder,
        itemCount: _infos.length,
      ),
    );
  }
}
