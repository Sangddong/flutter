import 'package:flutter/material.dart';

class NumberToImage extends StatelessWidget {
  final int maxNumber;

  const NumberToImage({
    super.key,
    required this.maxNumber
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: maxNumber
        .toInt()
        .toString()
        .split('')
        .map(
          (number) => Image.asset(
            'asset/img/$number.png',
            width: 50,
            height: 70,
          )
        ).toList(),
    );
  }
}
