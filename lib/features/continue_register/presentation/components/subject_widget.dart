
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:trials/core/constants/font_size.dart';
import 'package:trials/core/constants/images.dart';

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
    margin: const EdgeInsets.only(left: 8.0,right: 8, bottom: 10),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: data.image,
              errorWidget: (context, url, error) => SvgPicture.asset(AppImages.global, color: Colors.green,)
            )
      ,SizedBox(height: getResponsiveFontSize(context, fontSize: 15),),
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