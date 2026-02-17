import 'package:flutter/material.dart';
import '../model/seg.dart';

class PillSegmentedControl extends StatelessWidget {
  final SegmentedButtonModel segmentedButton;
  final double height;

  const PillSegmentedControl({
    required this.segmentedButton,
    this.height = 48.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final optionCount = segmentedButton.optionList.length;
    final denominator = (optionCount - 1) > 0 ? (optionCount - 1) : 1;

    final x = -1.0 + (2.0 * segmentedButton.selectedId) / denominator;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height,
          padding: const EdgeInsets.all(4.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(999.0), // Pill shape
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOut,
                alignment: Alignment(x, 0),
                child: FractionallySizedBox(
                  widthFactor: 1 / optionCount,
                  heightFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(999.0),
                    ),
                  ),
                ),
              ),
              Row(
                children: segmentedButton.optionList.asMap().entries.map(
                    (entry) {
                      final id = entry.key;
                      final option = entry.value;

                      return SegmentedItem(
                        selected: id == segmentedButton.selectedId,
                        optionId: id,
                        optionName: option,
                        onPressed: (id) => segmentedButton.action(id),
                      );
                    },
                  ).toList()
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SegmentedItem extends StatelessWidget {
  final bool selected;
  final int optionId;
  final String optionName;
  final void Function(int) onPressed;

  const SegmentedItem({
    required this.selected,
    required this.optionId,
    required this.optionName,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0.0,
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () => onPressed(optionId),
        child: Text(
          optionName,
          style: TextStyle(
            color: selected ? Colors.grey : Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20.0
          ),
        ),
      ),
    );
  }
}