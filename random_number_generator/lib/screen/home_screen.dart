import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              _Header(),
              _Body(),
              _Footer()
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

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
            onPressed: (){},
            icon: Icon(Icons.settings)
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
          '''
                  123
                  456
                  123
                  '''
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: redColor,
            foregroundColor: Colors.white
        ),
        onPressed: (){},
        child: Text('생성하기')
    );
  }
}
