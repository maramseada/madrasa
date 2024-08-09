
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';

class PhoneTextField extends StatelessWidget {
  final String? errorText;
  final String? initialValue;
  final String? hintText;
  final TextEditingController? controller; // Use a controller to access the text
  final Function(String) onChanged;

  const PhoneTextField({
    Key? key,
    this.initialValue,
    this.controller, // Initialize the controller
    this.errorText, this.hintText, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(AppColors.grayBorder), width: 1),
          ),
            child:TextFormField(
              onChanged: onChanged,
              controller: controller, // Use the controller here
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.right,
              maxLength: 11,

              decoration:  InputDecoration(
                hintText: hintText,
                border: InputBorder
                    .none, // Remove the inner border to avoid conflict with outer border
                hintStyle: AppStyles.styleRegular14(context: context, color: Color(AppColors.grayText)),
                counterText: '', // This hides the counter text
                contentPadding: const EdgeInsets.symmetric(
                    vertical:
                    10),
              ),),
          ),
          // Display error text if errorText is not null
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                errorText!,
                style: AppStyles.styleRegular12(
                  context: context,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}