import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import 'choose_option__widget.dart';


class SchoolYearSliver extends StatefulWidget {
  const SchoolYearSliver({super.key});

  @override
  State<SchoolYearSliver> createState() => _SchoolYearSliverState();
}

class _SchoolYearSliverState extends State<SchoolYearSliver> {
  List<int> indexes = [];

  @override
  Widget build(BuildContext context) {
    return        SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          ChooseOptionsWidget(
            index: 1,
            selectedIndex: indexes.contains(1) ? 1 : null,
            onSelected: (index) => _handleSelection(index),
            title:   'الصف الخامس',
          ), ChooseOptionsWidget(
            index: 2,
            selectedIndex: indexes.contains(2) ? 2 : null,
            onSelected: (index) => _handleSelection(index),
            title:    'الصف السادس',
          ), ChooseOptionsWidget(
            index: 3,
            selectedIndex: indexes.contains(3) ? 3 : null,
            onSelected: (index) => _handleSelection(index),
            title:     'الصف السابع',
          ), ChooseOptionsWidget(
            index: 4,
            selectedIndex: indexes.contains(4) ? 4 : null,
            onSelected: (index) => _handleSelection(index),
            title:       'الصف الثامن',
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
