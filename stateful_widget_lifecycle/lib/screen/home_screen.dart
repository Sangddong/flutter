import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = false;

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

class CodeFactoryWidget extends StatefulWidget {
  CodeFactoryWidget({super.key}) {
    print('1) Stateful Widget Constructor');
  }

  @override
  State<CodeFactoryWidget> createState() {
    print('2) Stateful Widget Create State');

    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {
  Color color = Colors.red;
  
  @override
  void initState() {
    print('3) Stateful Widget InitState');

    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('4) Stateful Widget DidChangeDependencies');

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('5) Stateful Widget Build');

    return GestureDetector(
      onTap: (){
        print('click');
        setState(() {
          color = color == Colors.red ? Colors.blue : Colors.red;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        color: color,
      ),
    );
  }

  @override
  void deactivate() {
    print('6) Stateful Widget Deactivate');

    super.deactivate();
  }

  @override
  void dispose() {
    print('7) Stateful Widget Dispose');
    super.dispose();
  }
}

