import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trials/core/constants/font_size.dart';
import 'package:trials/core/constants/text.dart';

import '../../../registration/presentation/components/register_new_animating_text.dart';
import '../components/additiona_notes_text_field.dart';
import '../components/birthday_select_widget.dart';
import '../components/disability_drop_down.dart';
import '../components/gender_drop_down.dart';
import '../components/nationality_drop_down.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
               RegisterNewAnimatingText(
                  color: Colors.yellow,
                  text:AppText.continuecontactInfo),
              SizedBox(height: getResponsiveFontSize(context, fontSize: 10),),
              BirthdaySelectWidget(
                hint: AppText.birthday,
                onDateSelected: (DateTime) {},
              ),         SizedBox(height: getResponsiveFontSize(context, fontSize: 10),),
              GenderDropDownWidget(
                onChanged: (String) {},
              ),      SizedBox(height: getResponsiveFontSize(context, fontSize: 10),),


              NationalityDropDownWidget(onChanged: (String ) {  },),
              SizedBox(height: getResponsiveFontSize(context, fontSize: 10),),


              DisabilityDropDown(
                onChanged: (String) {},
              ),
      SizedBox(height: getResponsiveFontSize(context, fontSize: 10),),
              AdditionalNotesTextField(onChanged: (String ) {  },)
      
            ],
          ),
        ),
      ),
    );
  }
}
