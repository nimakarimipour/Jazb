import 'package:flutter/material.dart';
import 'package:jazb/pages/list_places_page.dart';

class CategoryPage extends StatelessWidget {
  final List<Map<String, String>> _infos = [
    {'img': 'assets/category/fine_dining.jpg', 'name': 'Fine Dining'},
    {'img': 'assets/category/groccery.jpg', 'name': 'Grocceries'},
    {'img': 'assets/category/event.jpg', 'name': 'Events'},
    {'img': 'assets/category/health.jpg', 'name': 'Health'},
    {'img': 'assets/category/fitness_and_spa.jpg', 'name': 'Fitness and Spa'},
    {'img': 'assets/category/retail.jpg', 'name': 'Retail'},
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: Center(
              child: Text(
                "Jazzb",
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF915FB5), Color(0xFFCA436B)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0, 1.0], 
                tileMode: TileMode.clamp
              ),
            ),
          ),
          Container(
            height: 25,
          ),
          Expanded(
            child: GridView.count(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              mainAxisSpacing: 30.0,
              crossAxisSpacing: 5.0,
              children: _infos
                  .map(
                    (element) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ListPlacesPage(element['name'])));
                          },
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      element['img'],
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      element['name'],
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
