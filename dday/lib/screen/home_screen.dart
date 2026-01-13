import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [_Top(), _Bottom()]),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'U&I',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 30,
            ),
          ),
          Text(
            'The day we first met',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RubikBubbles',
              fontSize: 20,
            ),
          ),
          Text(
            '2025.11.24',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RubikBubbles',
              fontSize: 15,
            ),
          ),
          IconButton(
            iconSize: 50,
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          Text(
            'D + 1',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RubikBubbles',
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/njd.jpg'));
  }
}
