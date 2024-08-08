import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trials/core/constants/text.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';

class CardTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String? errorText;
  final TextEditingController? controller;
  const CardTextField({
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
                hintText: AppText.cardNumber,
                prefixIcon: Icon(
                  Icons.lock_outline_rounded,
                  color: Color(AppColors.grayColor),
                ),
                hintStyle: AppStyles.styleRegular14(
                  context: context,
                  color: Color(AppColors.grayText),
                ),
                border: InputBorder.none, // Remove the inner border to avoid conflict with outer border
                contentPadding: const EdgeInsets.symmetric(vertical: 10), // Add vertical padding for better alignment
              ),
              keyboardType: TextInputType.number, // Shows the numeric keyboard
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly, // Allows only digits
                LengthLimitingTextInputFormatter(16), // Limits input to 10 digits
              ],
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
