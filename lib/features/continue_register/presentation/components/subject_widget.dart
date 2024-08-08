
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/material_model.dart';

class SubjectWidget extends StatelessWidget {
  final MaterialModel data;
  final int index;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const SubjectWidget({
    super.key,
    required this.index,
    required this.data,
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
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: data.image),
            Text(
              data.arabicLanguage,
              style: TextStyle(fontSize: 16), // Adjust with your AppStyles
            ),
          ],
        )
      ),
    );
  }
}