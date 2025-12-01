import 'package:flutter/material.dart';
import 'package:rows_and_columns/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: colors.asMap().entries.map((entry) {
            int idx = entry.key;
            Color value = entry.value;

            if(idx % 2 != 0) {
              return Container(
                height: 50.0,
                width: 50.0,
                color: value,
              );
            } else {
              return Row(
                mainAxisAlignment: idx == 0 ? MainAxisAlignment.spaceAround : MainAxisAlignment.end,
                children: colors.map((c) => Container(
                  height: 50.0,
                  width: 50.0,
                  color: c,
                )).toList(),
              );
            }
          }).toList()
        ),
      ),
    );
  }
}