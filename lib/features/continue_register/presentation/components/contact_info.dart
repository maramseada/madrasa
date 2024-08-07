import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../registration/presentation/components/register_new_animating_text.dart';
import 'birthday_select_widget.dart';
import 'gender_drop_down.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
     textDirection: TextDirection.ltr, child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const RegisterNewAnimatingText(
                color: Colors.yellow,
                text:
                    'نحن هنا لمساعدتك في رحلتك التعلبمبه املأ بينات الاتصال الخاصة بك لنتمكن من توجيهك خطوة بخطوة '),


            GenderDropDownWidget(onChanged: (String ) {  },),
            BirthdaySelectWidget()
          ],
        ),
      ),
    );
  }
}
