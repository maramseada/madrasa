
import 'package:flutter/material.dart';

import '../../data/models/day_model.dart';

class DaysWidget extends StatelessWidget {
  final DaysModel data;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;
  const DaysWidget(
      {super.key,
        this.selectedIndex,
        required this.onSelected, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(data.id);
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
              color:
              data.id == selectedIndex ? Colors.green : Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          data.arabicLanguage,
          style: const TextStyle(fontSize: 16), // Adjust with your AppStyles
        ),
      ),
    );
  }
}
