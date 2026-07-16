import 'package:flutter/material.dart';


class AppTheme {

  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,


    scaffoldBackgroundColor:
        const Color(0xffF8FAFC),



    colorScheme: const ColorScheme.light(

      primary: Color(0xff015254),

      secondary: Color(0xffFACC15),

      surface: Colors.white,

      onSurface: Color(0xff18181B),

    ),



    appBarTheme: const AppBarTheme(

      backgroundColor: Color(0xff015254),

      foregroundColor: Colors.white,

      centerTitle: true,

      elevation: 0,

    ),



    cardTheme: CardThemeData(

      color: Colors.white,

      elevation: 6,


      shape: RoundedRectangleBorder(

        borderRadius:
            BorderRadius.all(
              Radius.circular(22),
            ),

      ),

    ),



    inputDecorationTheme: InputDecorationTheme(

      filled: true,

      fillColor: Colors.white,


      labelStyle: TextStyle(

        color: Color(0xff015254),

        fontWeight: FontWeight.w600,

      ),


      floatingLabelStyle: TextStyle(

        color: Color(0xffFACC15),

        fontWeight: FontWeight.bold,

      ),


      prefixIconColor:

          Color(0xff015254),



      focusedBorder: OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(16),

        borderSide: BorderSide(

          color: Color(0xffFACC15),

          width: 2,

        ),

      ),

    ),

  );

}