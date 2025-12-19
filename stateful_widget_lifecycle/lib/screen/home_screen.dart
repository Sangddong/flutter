import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(show) CodeFactoryWidget(),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  show = !show;
                });
              },
              child: Text('클릭해서 박스 노출/비노출')
            )
          ],
        ),
      )
    );
  }
}

class CodeFactoryWidget extends StatelessWidget {
  const CodeFactoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}

