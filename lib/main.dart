import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: CategoriesScreen(),
      routes: {
        //We can set a string for all the pages here to move between this pages using Navigator.of(context).pushNamed('set here the string of the page that we want to move to it ')
        '/': (ctx) =>
            TabsScreen(), //This '/' is defult route for home screen
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },

      /**
       * This called when you clicked to route that not in routes above , it is like defult page to go when we havn't screen to go 
       */
      onGenerateRoute: (settings) {
        print(settings.arguments);
/*
        if(settings.name == '/meal-detail'){
          return ... ;
        }else if (settings.name = '/something-else'){
          return ... ;
        }

        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        */
      },

      /**
       * This runs if all the reoust above can't be reached or there is no onGenerateToute method 
       * So we can use it for errors if no reute can be reached
       */
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

    );
  }
}
