import 'package:dday/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(theme: ThemeData(
          textTheme: TextTheme(
              bodyLarge: TextStyle(
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontSize: 80,
              ),
              bodyMedium: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikBubbles',
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikBubbles',
                fontSize: 15,
              ),
              displayLarge: TextStyle(
                color: Colors.white,
                fontFamily: 'RubikBubbles',
                fontSize: 30,
              )
          )
      ), home: HomeScreen()
    )
  );
}
