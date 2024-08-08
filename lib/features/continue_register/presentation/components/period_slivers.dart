import 'package:flutter/material.dart';
import 'package:trials/core/constants/text.dart';

import 'choose_option__widget.dart';

class PeriodSlivers extends StatefulWidget {
  final ValueChanged<int?> onPeriodChanged;

  const PeriodSlivers({super.key, required this.onPeriodChanged});

  @override
  State<PeriodSlivers> createState() => _PeriodSliversState();
}

class _PeriodSliversState extends State<PeriodSlivers> {
  int? selectedIndex;

  void _handleSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onPeriodChanged(index); // Notify parent about the selection
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
            title: AppText.morning,
          ),
          ChooseOptionsWidget(
            index: 2,
            selectedIndex: selectedIndex,
            onSelected: (index) => _handleSelection(index),
            title: AppText.night,
          ),
        ],
      ),
    );
  }
}
