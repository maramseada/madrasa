import 'package:flutter/material.dart';
import 'package:trials/core/constants/navigator.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/components/button_widget.dart';
import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/text.dart';
import '../components/dont_have_account_widget.dart';
import '../components/new_register_component.dart';
import '../components/register_new_animating_text.dart';
import '../components/registration_options.dart';
import 'new_registration.dart';

class RegistrationOptions extends StatefulWidget {
  const RegistrationOptions({super.key});

  @override
  State<RegistrationOptions> createState() => _RegistrationOptionsState();
}

int selectedIndexSignUp = 1;

class _RegistrationOptionsState extends State<RegistrationOptions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveFontSize(context, fontSize: 15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const NewRegisterComponent(),
              const RegisterNewAnimatingText(
                color: Colors.green,
                text:
                    'هل انت طالب تسعى الي توسيع افاقك و فتح ابواب المعرفة؟ أم ولي أمر تود متابعة رحلة ابنك المستقبلية ودعمة فب اكتشاف شغفة',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionsWidget(
                    image: AppImages.parent,
                    index: 2,
                    selectedIndex: selectedIndexSignUp,
                    onSelected: (index) {
                      setState(() {
                        selectedIndexSignUp = index;
                      });
                    },
                    title: 'ولي امر',
                  ),
                  OptionsWidget(
                    image: AppImages.student,
                    index: 1,
                    selectedIndex: selectedIndexSignUp,
                    onSelected: (index) {
                      setState(() {
                        selectedIndexSignUp = index;
                      });
                    },
                    title: 'طالب',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  navigateTo(context, const NewRegistration());
                },
                child: ButtonWidget(
                  widget: Text(
                    AppText.next,
                    style: AppStyles.style40016(
                        context: context, color: Colors.white),
                  ),
                ),
              ),
              const DontHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
