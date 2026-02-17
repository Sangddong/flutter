import 'package:flutter/material.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({super.key});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

enum Calendar { day, week, month, year }

class _DesignScreenState extends State<DesignScreen> {
  // State for the default segmented button
  Set<Calendar> _selectedSegmentDefault = {Calendar.day};

  // State for the colored segmented button
  Set<Calendar> _selectedSegmentColor = {Calendar.day};

  // State for the bordered segmented button
  Set<Calendar> _selectedSegmentBorders = {Calendar.day};

  // State for the icon segmented button
  Set<Calendar> _selectedSegmentIcon = {Calendar.day};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SegmentedButton Examples'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Default Style',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SegmentedButton<Calendar>(
                  segments: const <ButtonSegment<Calendar>>[
                    ButtonSegment<Calendar>(value: Calendar.day, label: Text('Day')),
                    ButtonSegment<Calendar>(value: Calendar.week, label: Text('Week')),
                    ButtonSegment<Calendar>(
                        value: Calendar.month, label: Text('Month')),
                    ButtonSegment<Calendar>(value: Calendar.year, label: Text('Year')),
                  ],
                  selected: _selectedSegmentDefault,
                  onSelectionChanged: (Set<Calendar> newSelection) {
                    setState(() {
                      _selectedSegmentDefault = newSelection;
                    });
                  },
                ),
                const SizedBox(height: 30),

                const Text('Custom Colors',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SegmentedButton<Calendar>(
                  style: SegmentedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.blue,
                    selectedForegroundColor: Colors.white,
                    selectedBackgroundColor: Colors.blue,
                  ),
                  segments: const <ButtonSegment<Calendar>>[
                    ButtonSegment<Calendar>(value: Calendar.day, label: Text('Day')),
                    ButtonSegment<Calendar>(value: Calendar.week, label: Text('Week')),
                    ButtonSegment<Calendar>(
                        value: Calendar.month, label: Text('Month')),
                    ButtonSegment<Calendar>(value: Calendar.year, label: Text('Year')),
                  ],
                  selected: _selectedSegmentColor,
                  onSelectionChanged: (Set<Calendar> newSelection) {
                    setState(() {
                      _selectedSegmentColor = newSelection;
                    });
                  },
                ),
                const SizedBox(height: 30),

                const Text('Custom Borders',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SegmentedButton<Calendar>(
                  style: SegmentedButton.styleFrom(
                    side: const BorderSide(color: Colors.purple, width: 2.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                  segments: const <ButtonSegment<Calendar>>[
                    ButtonSegment<Calendar>(value: Calendar.day, label: Text('Day')),
                    ButtonSegment<Calendar>(value: Calendar.week, label: Text('Week')),
                    ButtonSegment<Calendar>(
                        value: Calendar.month, label: Text('Month')),
                    ButtonSegment<Calendar>(value: Calendar.year, label: Text('Year')),
                  ],
                  selected: _selectedSegmentBorders,
                  onSelectionChanged: (Set<Calendar> newSelection) {
                    setState(() {
                      _selectedSegmentBorders = newSelection;
                    });
                  },
                ),
                const SizedBox(height: 30),

                const Text('With Icons',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SegmentedButton<Calendar>(
                  segments: const <ButtonSegment<Calendar>>[
                    ButtonSegment<Calendar>(
                        value: Calendar.day, icon: Icon(Icons.calendar_view_day)),
                    ButtonSegment<Calendar>(
                        value: Calendar.week, icon: Icon(Icons.calendar_view_week)),
                    ButtonSegment<Calendar>(
                        value: Calendar.month, icon: Icon(Icons.calendar_view_month)),
                    ButtonSegment<Calendar>(
                        value: Calendar.year, icon: Icon(Icons.calendar_today)),
                  ],
                  selected: _selectedSegmentIcon,
                  onSelectionChanged: (Set<Calendar> newSelection) {
                    setState(() {
                      _selectedSegmentIcon = newSelection;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
