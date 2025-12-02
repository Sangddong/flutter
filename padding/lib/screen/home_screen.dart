import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Padding(
            // padding: EdgeInsets.all(16.0),

            // padding: EdgeInsets.symmetric(
            //     vertical: 16.0,
            //     horizontal: 32.0
            // ),

            // padding: EdgeInsets.only(
            //   top:8.0,
            //   left: 48.0,
            //   right: 16.0,
            //   bottom: 32.0
            // ),

            padding: EdgeInsets.fromLTRB(48.0, 8.0, 16.0, 32.0),
            child: Container(
              color: Colors.red,
              width: 16.0,
              height: 16.0,
            ),
          )
        ),
      ),
    );
  }
}
