import 'package:flutter/cupertino.dart';
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
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Expanded(
      child: Column(
        children: [
          Text(
            'U&I',
            style: textTheme.bodyLarge,
          ),
          Text(
            'The day we first met',
            style: textTheme.bodyMedium,
          ),
          Text(
            '2025.11.24',
            style: textTheme.bodySmall,
          ),
          IconButton(
            iconSize: 50,
            color: Colors.white,
            onPressed: () {
              showCupertinoDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.white,
                      height: 300,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime date) {
                          print(date);
                        },
                        dateOrder: DatePickerDateOrder.ymd,
                      ),
                    ),
                  );
                });
            },
            icon: Icon(Icons.favorite),
          ),
          Text(
            'D + 1',
            style: textTheme.displayLarge,
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
