import 'package:flutter/material.dart';
import 'package:hello_world/model/seg.dart';
import 'package:hello_world/screens/segment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> optionList = ["S", "M", "L", "XL"];
  int selectedId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          widthFactor: double.infinity,
          heightFactor: double.infinity,
          child: PillSegmentedControl(
            segmentedButton: SegmentedButtonModel(
              optionList: optionList,
              selectedId: selectedId,
              action: (int newOptionId) {
                setState(() {
                  selectedId = newOptionId;
                });
              }
            )
          ),
        ),
      ),
    );
  }
}
