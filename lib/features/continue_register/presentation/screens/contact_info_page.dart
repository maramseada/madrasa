import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trials/core/constants/font_size.dart';
import 'package:trials/core/constants/text.dart';

import '../../../registration/presentation/components/register_new_animating_text.dart';
import '../../../registration/presentation/controller/sign_up_controller.dart';
import '../components/additiona_notes_text_field.dart';
import '../components/birthday_select_widget.dart';
import '../components/disability_drop_down.dart';
import '../components/gender_drop_down.dart';
import '../components/nationality_drop_down.dart';

class ContactInfo extends StatefulWidget {

 final SignUpController controller;
  const ContactInfo({super.key,
required this.controller});

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {


  void onGenderChanged(String gender) {
    setState(() {
      widget.controller.selectedGender = gender;
    });
  }

  void onNationalityChanged(String nationality) {
    setState(() {
      widget.controller.selectedNationality = nationality;
    });
  }

  void onDisabilityChanged(String disability) {
    setState(() {
      widget.controller.selectedDisability = disability;
    });
  }

  void onAdditionalNotesChanged(String notes) {
    setState(() {
      widget.controller.additionalNotes = notes;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BirthdaySelectWidget(
          onDateSelected: (DateTime date) {
            setState(() {
              widget.controller.selectedBirthday = date;
            });
          },
        ),
        SizedBox(
          height: getResponsiveFontSize(context, fontSize: 10),
        ),
        GenderDropDownWidget(
          onChanged: onGenderChanged,
        ),
        SizedBox(
          height: getResponsiveFontSize(context, fontSize: 10),
        ),
        NationalityDropDownWidget(
          onChanged: onNationalityChanged,
        ),
        SizedBox(
          height: getResponsiveFontSize(context, fontSize: 10),
        ),
        DisabilityDropDown(
          onChanged: onDisabilityChanged,
        ),
        SizedBox(
          height: getResponsiveFontSize(context, fontSize: 10),
        ),
        AdditionalNotesTextField(
          onChanged: onAdditionalNotesChanged,
        ),
      ],
    );
  }
}
