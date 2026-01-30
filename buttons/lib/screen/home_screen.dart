import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              print('ElevatedButton');
            },
            child: Text('ElevatedButton'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              disabledBackgroundColor: Colors.grey,
              foregroundColor: Colors.white
            ),
          ),
          OutlinedButton(
            onPressed: (){
              print('OutlinedButton');
            },
            child: Text('OutlinedButton')
          ),
          TextButton(
            onPressed: (){
              print('TextButton');
            },
            child: Text('TextButton')
          )
        ],
      ),
    );
  }
}
