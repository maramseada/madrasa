import 'package:flutter/material.dart';

import '../../../../core/constants/text.dart';
import 'choose_option__widget.dart';
class ClassHoursSlivers extends StatefulWidget {
  final ValueChanged<String?> onClassHoursChanged;

  const ClassHoursSlivers({super.key, required this.onClassHoursChanged});

  @override
  State<ClassHoursSlivers> createState() => _ClassHoursSliversState();
}

class _ClassHoursSliversState extends State<ClassHoursSlivers> {
  int? selectedIndex;

  final List<String> timeValues = ['00:30', '01:00', '01:30', '02:00', '02:30'];

  // Map time values to their corresponding text from AppText
  final Map<String, String> timeTextMap = {
    '00:30': AppText.halfHour,
    '01:00': AppText.hour,
    '01:30': AppText.hourAndHalf,
    '02:00': AppText.twoHours,
    '02:30': AppText.twoHoursAndHalf,
  };

  void _handleSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index >= 0 && index < timeValues.length) {
      widget.onClassHoursChanged(timeValues[index]); // Notify parent about the selection
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: List.generate(timeValues.length, (index) {
          final timeValue = timeValues[index];
          return ChooseOptionsWidget(
            index: index,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index),
            title: timeTextMap[timeValue] ?? '', // Get the corresponding text
          );
        }),
      ),
    );
  }
}
