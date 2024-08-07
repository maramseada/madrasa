
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';

class NationalityDropDownWidget extends StatefulWidget {
  final Function(String) onChanged;
  final String? initialValue;

  const NationalityDropDownWidget({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<NationalityDropDownWidget> createState() => _NationalityDropDownWidgetState();
}

class _NationalityDropDownWidgetState extends State<NationalityDropDownWidget> {
  String? selectedGender;
  List<String> genders = ['Bahamian'	,'Bahraini',	'Bangladeshi'	,'Barbadian','Egyptian', ];

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
          icon:  Icon(
            Icons.keyboard_arrow_down,
              color: Color(AppColors.grayText)          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: selectedGender == null ? AppText.nationality : '',
            hintStyle: AppStyles.styleBold16(
              context: context,
              color:Color(AppColors.grayText),), // Replace with your text style
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
          style: AppStyles.styleBold16(
            context: context,
            color:Color(AppColors.grayText),),
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
