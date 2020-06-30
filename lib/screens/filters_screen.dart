import 'package:flutter/material.dart';
import 'package:meal_app/screens/my_drawer_screen.dart';

class FiltersScreen extends StatelessWidget {
  static const String routeName = '/filters-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawerScreen(),
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: Center(
        child: Text('Filters sreen !! '),
      ),
    );
  }
}
