
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';

class CardNameTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String? errorText;
  final TextEditingController? controller;

  const CardNameTextField({
    super.key,
    required this.onChanged,
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
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green, width: 1),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: AppText.cardName,
                hintStyle: AppStyles.styleRegular14(
                  context: context,
                  color: Color(AppColors.grayText),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),

              textAlign: TextAlign.right,
              onChanged: onChanged,
              controller: controller,
            ),
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
          ),
      ],
    );
  }
}
