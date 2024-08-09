
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';class DisabilityDropDown extends StatefulWidget {
  final Function(String) onChanged;
  final String? initialValue;

  const DisabilityDropDown({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<DisabilityDropDown> createState() => _DisabilityDropDownState();
}

class _DisabilityDropDownState extends State<DisabilityDropDown> {
  String? selectedDisability;
  List<String> disabilities = [AppText.yesdisabilty, AppText.noDisabilty];

  @override
  void initState() {
    super.initState();
    selectedDisability = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(AppColors.grayBorder), width: 1),
          color: Colors.white,
        ),
        child: DropdownButtonFormField<String>(
          value: selectedDisability,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Color(AppColors.grayText),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: selectedDisability == null ? AppText.disabilty : '',
            hintStyle: AppStyles.styleBold16(
              context: context,
              color: Color(AppColors.grayText),
            ), // Replace with your text style
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
          style: AppStyles.styleBold16(
            context: context,
            color: Color(AppColors.grayText),
          ),
          dropdownColor: Colors.white, // Replace with your text style
          items: disabilities.map<DropdownMenuItem<String>>((String disability) {
            return DropdownMenuItem<String>(
              alignment: Alignment.centerRight,
              value: disability,
              child: Text(disability),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedDisability = newValue;
            });
            String result = (selectedDisability == AppText.yesdisabilty)
                ? "Yes"
                : "No";
            widget.onChanged(result);
          },
        ),
      ),
    );
  }
}
