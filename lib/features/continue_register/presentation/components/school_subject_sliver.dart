import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import 'choose_option__widget.dart';
class SchoolSubjectSliver extends StatefulWidget {
  const SchoolSubjectSliver({super.key});

  @override
  State<SchoolSubjectSliver> createState() => _SchoolSubjectSliverState();
}
List<int> indexes = [];

class _SchoolSubjectSliverState extends State<SchoolSubjectSliver> {

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
            title:                 'المنهج البريطاني',

          ),
          ChooseOptionsWidget(
            index: 2,
            selectedIndex: indexes.contains(2) ? 2 : null,
            onSelected: (index) => _handleSelection(index),
            title:       'المنهج اللأمريكي',
          ),
          ChooseOptionsWidget(
            index: 3,
            selectedIndex: indexes.contains(3) ? 3 : null,
            onSelected: (index) => _handleSelection(index),
            title:  'المنهج الوزاري',
          ),
          ChooseOptionsWidget(
            index: 4,
            selectedIndex: indexes.contains(4) ? 4 : null,
            onSelected: (index) => _handleSelection(index),
            title:    'أخرى ',
          ),



        ],
      ),
    );
  }void _handleSelection(int index) {
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

