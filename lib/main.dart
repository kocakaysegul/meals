import 'package:flutter/material.dart';
import './categories_screen.dart';
import 'package:meals/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
            fontFamily: 'RobotoCondensed',
            fontSize: 20,

          ),

        ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/', // default is /
      routes: {
        '/' : (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
      },
    );
  }
}

