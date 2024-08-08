import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';

class ChooseOptionsWidget extends StatelessWidget {
  final String title;
  final int index;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const ChooseOptionsWidget({
    super.key,
    required this.index,
    required this.title,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
          color: Colors.white,
          border: Border.all(
            color: index == selectedIndex ? Colors.green :Colors.transparent
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16), // Adjust with your AppStyles
        ),
      ),
    );
  }
}