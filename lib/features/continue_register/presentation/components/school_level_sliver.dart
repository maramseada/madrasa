
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import 'choose_option__widget.dart';

class SchoolLevelSliver extends StatefulWidget {
  const SchoolLevelSliver({super.key});

  @override
  State<SchoolLevelSliver> createState() => _SchoolLevelSliverState();
}

class _SchoolLevelSliverState extends State<SchoolLevelSliver> {
  List<int> indexes = [];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          ChooseOptionsWidget(
            index: 1,
            selectedIndex: indexes.contains(1) ? 1 : null,
            onSelected: (index) => _handleSelection(index),
            title: 'رياض اطفال',
          ),
          ChooseOptionsWidget(
            index: 2,
            selectedIndex: indexes.contains(2) ? 2 : null,
            onSelected: (index) => _handleSelection(index),
            title: 'التعليم الابتدائي',
          ),
        ],
      ),
    );
  }

  void _handleSelection(int index) {
    setState(() {
      if (indexes.contains(index)) {
        indexes.remove(index);
      } else {
        indexes.add(index);
      }
    });
    print(indexes);
  }
}
