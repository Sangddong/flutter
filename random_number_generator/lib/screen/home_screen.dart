import 'package:flutter/material.dart';
import 'package:random_number_generator/componant/number_to_image.dart';
import 'package:random_number_generator/constant/color.dart';
import 'dart:math';
import 'package:random_number_generator/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> numbers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(
                onPressed: onSettingIconPressed,
              ),
              _Body(
                numbers: numbers
              ),
              _Footer(
                onPressed: generateRandomNumber,
              )
            ],
          ),
        ),
      ),
    );
  }

  onSettingIconPressed () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context){
          return SettingScreen();
        }
      )
    );
  }

  generateRandomNumber () {
    final Set<int> newNumbers = {};

    while(newNumbers.length < 3) {
      final randomNumber = Random().nextInt(1000);
      newNumbers.add(randomNumber);
    }

    setState(() {
      numbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.w700
          ),
        ),
        IconButton(
            color: redColor,
            onPressed: onPressed,
            icon: Icon(Icons.settings)
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> numbers;

  const _Body({
    super.key,
    required this.numbers
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers
          .map(
            (e) => NumberToImage(
              maxNumber: e
            )
          )
          .toList()
      )
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: redColor,
            foregroundColor: Colors.white
        ),
        onPressed: onPressed,
        child: Text('생성하기')
    );
  }
}
