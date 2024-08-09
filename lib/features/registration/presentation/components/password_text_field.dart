import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';


class PasswordTextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController?
      controller; // Use a controller to access the text
  final String? hintText;
  final String? errorText;

  const PasswordTextField({
    Key? key,
    required this.onChanged,
    this.errorText,
    this.controller,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(AppColors.grayBorder), width: 1),
            ),
            child: TextFormField(
              obscureText: true,
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr,
              controller: controller, // Use the controller here
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppStyles.styleRegular14(context: context, color: Color(AppColors.grayText)),
                border: InputBorder
                    .none, // Remove the inner border to avoid conflict with outer border
                contentPadding: const EdgeInsets.symmetric(
                    vertical:
                        10), // Add vertical padding for better alignment
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
      ),
    );
  }
}
