import 'package:flutter/material.dart';

import '../../../../core/constants/text.dart';
import 'choose_option__widget.dart';

class ClassesPerWeekSlivers extends StatefulWidget {
  final ValueChanged<int?> onClassesPerWeekChanged;

  const ClassesPerWeekSlivers({super.key, required this.onClassesPerWeekChanged});

  @override
  State<ClassesPerWeekSlivers> createState() => _ClassesPerWeekSliversState();
}

class _ClassesPerWeekSliversState extends State<ClassesPerWeekSlivers> {
  int? selectedIndex;

  void _handleSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onClassesPerWeekChanged(index); // Notify parent about the selection
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
            title: AppText.oneClass,
          ),
          ChooseOptionsWidget(
            index: 2,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index),
            title: AppText.twoClasses,
          ),
        ],
      ),
    );
  }
}
