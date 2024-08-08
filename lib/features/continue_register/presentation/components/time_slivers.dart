import 'package:flutter/material.dart';

import 'choose_option__widget.dart';class TimeSlivers extends StatefulWidget {
  final ValueChanged<int?> onTimeChanged;

  const TimeSlivers({super.key, required this.onTimeChanged});

  @override
  State<TimeSlivers> createState() => _TimeSliversState();
}

class _TimeSliversState extends State<TimeSlivers> {
  int? selectedIndex;
  String? title;

  void _handleSelection(int index, String selectedTitle) {
    setState(() {
      selectedIndex = index;
      title = selectedTitle;
      print('Selected Index: $selectedIndex, Title: $title');
      widget.onTimeChanged(index); // Notify parent about the selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          ChooseOptionsWidget(
            index: 1,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index, '15:00'),
            title: '15:00',
          ),
          ChooseOptionsWidget(
            index: 2,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index, '12:00'),
            title: '12:00',
          ),
        ],
      ),
    );
  }
}

