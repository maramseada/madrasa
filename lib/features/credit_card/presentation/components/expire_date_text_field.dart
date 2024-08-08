import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trials/core/constants/text.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import 'expire_dateformater.dart';

class ExpiryDateTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String? errorText;
  final TextEditingController? controller;

  const ExpiryDateTextField({super.key, required this.onChanged, this.errorText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green, width: 1),
          ),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              ExpiryDateFormatter(),
            ],
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: InputBorder.none, // Remove the inner border to avoid conflict with outer border

              hintText: AppText.expireDate,
              hintStyle: AppStyles.styleRegular14(
                context: context,
                color: Color(AppColors.grayText),
              ),
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
          )
      ],
    );
  }
}
