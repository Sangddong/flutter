import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              ),
              _Bottom()
            ]
          ),
        ),
      ),
    );
  }

  void onHeartPressed(){
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
                setState(() {
                  selectedDate = date;
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      }
    );
  }
}

class _Top extends StatefulWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({
    super.key,
    required this.selectedDate,
    required this.onPressed
  });

  @override
  State<_Top> createState() => _TopState();
}

class _TopState extends State<_Top> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
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
            '${widget.selectedDate.year}.${widget.selectedDate.month}.${widget.selectedDate.day}',
            style: textTheme.bodySmall,
          ),
          IconButton(
            iconSize: 50,
            color: Colors.white,
            onPressed: widget.onPressed,
            icon: Icon(Icons.favorite),
          ),
          Text(
            'D + ${now.difference(widget.selectedDate).inDays + 1}',
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
