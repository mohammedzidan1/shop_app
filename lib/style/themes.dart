import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';
ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.white,
 // scaffoldBackgroundColor: HexColor('333739'),
  scaffoldBackgroundColor: Color.fromARGB(9, 69, 99, 1),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      iconTheme: IconThemeData(
        color: Colors.white,
        // opacity: 33,
      ),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
       // statusBarColor: HexColor('333739'),
        statusBarColor: Color.fromARGB(9, 69, 99, 1),
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0.0,
      //backgroundColor: HexColor('333739'),
      backgroundColor: Color.fromARGB(9, 69, 99, 1),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w900)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    // backgroundColor: Colors.black45,
    selectedItemColor: Colors.yellowAccent,
    elevation: 20.0,
   // backgroundColor: HexColor('333739'),
    backgroundColor: Color.fromARGB(9, 69, 99, 1),
    unselectedItemColor: Colors.white60,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    ),
  ),
);
ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,

  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    // toolbarTextStyle:TextStyle(
    //   color: Colors.deepOrange,
    // ) ,
      titleSpacing: 20.0,
      iconTheme: IconThemeData(
        color: Colors.black,
        // opacity: 33,
      ),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w900)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    // backgroundColor: Colors.black45,
    selectedItemColor: defaultColor,
    elevation: 20.0,

    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
  ),
);
