import 'package:flutter/material.dart';
import 'package:random_number_generator/componant/number_to_image.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 16
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider(
                value: maxNumber,
                onChanged: onSliderChanged,
              ),
              _Button()
            ],
          ),
        ),
      ),
    );
  }

  onSliderChanged (double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Number extends StatelessWidget {
  final double maxNumber;

  const _Number({
    super.key,
    required this.maxNumber
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberToImage(
        maxNumber: maxNumber.toInt()
      )
    );
  }
}

class _Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({
    super.key,
    required this.value,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 1000,
      max: 100000,
      activeColor: redColor,
      onChanged: onChanged
    );
  }
}


class _Button extends StatelessWidget {
  const _Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: redColor,
            foregroundColor: Colors.white
        ),
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Text('저장')
    );
  }
}
