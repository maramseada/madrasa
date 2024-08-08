import 'package:flutter/material.dart';
import 'package:trials/core/constants/text.dart';

import 'choose_option__widget.dart';class StudentNumberSlivers extends StatefulWidget {
  final ValueChanged<int?> onSelectionChanged; // Callback for selection changes

  const StudentNumberSlivers({super.key, required this.onSelectionChanged});

  @override
  State<StudentNumberSlivers> createState() => _StudentNumberSliversState();
}

class _StudentNumberSliversState extends State<StudentNumberSlivers> {
  int? selectedIndex;

  void _handleSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onSelectionChanged(selectedIndex); // Notify parent about the selection
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
            onSelected: (index) => _handleSelection(index),
            title: AppText.oneStudent,
          ),
          ChooseOptionsWidget(
            index: 2,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index),
            title: AppText.twoStudents,
          ),
          ChooseOptionsWidget(
            index: 3,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index),
            title: AppText.moreThanTwoStudents,
          ),
          ChooseOptionsWidget(
            index: 4,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index),
            title: AppText.other,
          ),
        ],
      ),
    );
  }
}
