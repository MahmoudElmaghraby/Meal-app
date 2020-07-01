import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*
   * We manage our favorit meals from here
   */
  List<Meal> _favoriteMeals = [];

/*
 * toggle => add or remove meals from favorit meals list
 */
  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere(
        //IndexWhere return the index for the element in the function return true , else it returns -1
        (meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      //I did find a favorit meal
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals.add(
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
      );
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) =>
        meal.id == mealId); // any => returns true if the function is true
  }

  /*
   * We manage our filters from here
   */
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetrian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _saveFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where(
        (meal) {
          if (_filters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactos'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetrian'] && !meal.isVegetarian) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

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
        '/': (ctx) => TabsScreen(
            _favoriteMeals), //This '/' is defult route for home screen
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _saveFilters),
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
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
