import 'package:flutter/material.dart';
import 'package:trials/core/constants/text.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import 'package:trials/core/constants/text.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';

class GenderDropDownWidget extends StatefulWidget {
  final Function(String) onChanged;
  final String? initialValue;

  const GenderDropDownWidget({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<GenderDropDownWidget> createState() => _GenderDropDownWidgetState();
}

class _GenderDropDownWidgetState extends State<GenderDropDownWidget> {
  String? selectedGender;
  List<String> genders = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color:Color(AppColors.grayBorder), width: 1),
          color: Colors.white,
        ),
        child: DropdownButtonFormField<String>(
          value: selectedGender,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFFafafaf),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: selectedGender == null ? AppText.gender : '',
            hintStyle: AppStyles.style40016(
                context: context,
                color:Color(AppColors.grayText),), // Replace with your text style
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
          ),
          style: const TextStyle(
              color: Colors.black),
          dropdownColor: Colors.white,// Replace with your text style
          items: genders.map<DropdownMenuItem<String>>((String gender) {

            return DropdownMenuItem<String>(

              alignment: Alignment.centerRight,
              value: gender,
              child: Text(gender),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedGender = newValue;
            });
            widget.onChanged(selectedGender!);
          },
        ),
      ),
    );
  }
}
