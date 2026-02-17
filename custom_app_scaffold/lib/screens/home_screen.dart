import 'package:custom_app_scaffold/layout/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../components/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBarItem(title: "Home"),
      body: Column(
        children: [
          Text("home", style: TextStyle(fontSize: 60.0),),
        ],
      )
    );
  }
}
