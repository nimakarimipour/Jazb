import 'package:flutter/material.dart';
import 'package:jazb/pages/category.dart';

import './list_places_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('LOGIN'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => CategoryPage()),
            );
          },
        ),
      ),
    );
  }
}
