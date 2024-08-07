import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';

class FamilyNameTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final String? errorText;
  final TextEditingController?
      controller; // Use a controller to access the text

  const FamilyNameTextField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      this.errorText,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Color(AppColors.grayBorder), width: 1),
              ),
              child: TextFormField(
                textAlign: TextAlign.right,
                onChanged: onChanged,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppStyles.styleRegular14(context: context),
                  border: InputBorder
                      .none, // Remove the inner border to avoid conflict with outer border
                  contentPadding: const EdgeInsets.symmetric(
                      vertical:
                          10), // Add vertical padding for better alignment
                ),
              ),
            )),
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
