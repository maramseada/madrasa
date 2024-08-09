import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/core/constants/images.dart';

import '../../../../core/constants/text.dart';

class PaymentCreditWidget extends StatelessWidget {
  final int value;
  final int? groupValue; // Allow null to represent no selection
  final Function(int?) onChanged;

  const PaymentCreditWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green, width: 1),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.creditCard, width: 20,),
          const SizedBox(width: 10),  SvgPicture.asset(AppImages.creditCard, width: 20,),
          const SizedBox(width: 10),  SvgPicture.asset(AppImages.creditCard, width: 20,),
          const Spacer(),
          const SizedBox(width: 10), // Add some space between the radio button and the text
          Text(
            AppText.creditCard,
            style: AppStyles.styleBold16(context: context),
          ),
          Radio<int>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: Colors.green, // Set the color of the selected radio button
          ),
        ],
      ),
    );
  }
}
