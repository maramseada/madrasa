
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trials/core/constants/text.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';

class AdditionalNotesTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String? hintText;
  final String? errorText;
  final TextEditingController?
  controller;
  const AdditionalNotesTextField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(AppColors.grayBorder), width: 1),
            ),
            child: TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText:hintText?? AppText.moreDetails,

                hintStyle: AppStyles.styleBold16(context: context, color: Color(AppColors.grayText)),
                border: InputBorder.none, // Remove the inner border to avoid conflict with outer border
                contentPadding: const EdgeInsets.symmetric(vertical: 10), // Add vertical padding for better alignment
              ),
              textAlign: TextAlign.right,
              onChanged: onChanged,
              controller: controller,              ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                errorText!,
                style: AppStyles.styleRegular12(
                  context: context,
                  color: Colors.red,
                ),
              ),
            ),
          ),  ],
    );
  }
}
