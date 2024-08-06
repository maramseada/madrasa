import 'package:flutter/material.dart';
import 'package:trials/core/constants/font_size.dart';
import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/core/constants/images.dart';
import 'package:trials/core/constants/text.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/components/button_widget.dart';
import '../components/dont_have_account_widget.dart';
import '../components/register_new_animating_text.dart';
import '../components/registration_options.dart';

class NewRegistration extends StatefulWidget {
  const NewRegistration({super.key});

  @override
  State<NewRegistration> createState() => _NewRegistrationState();
}
int selectedIndexSignUp = 1;

class _NewRegistrationState extends State<NewRegistration> {
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
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                  duration: const Duration(seconds: 1),
                ),
                atRestEffect: WidgetRestingEffects.none(),
                child: Text(
                  'تسجيل جديد',
                  style: AppStyles.styleBold30(context: context),
                ),
              ),
              const RegisterNewAnimatingText(),
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
                    }, title: 'ولي امر',
                  ),       OptionsWidget(
                    image: AppImages.student,
                    index:1,
                    selectedIndex: selectedIndexSignUp,
                    onSelected: (index) {
                      setState(() {
                        selectedIndexSignUp = index;
                      });
                    }, title: 'طالب',
                  ),
                ],
              ),
              const SizedBox(height: 20,)
,              ButtonWidget(
                widget: Text(
                  AppText.next,
                  style: AppStyles.style40016(
                      context: context, color: Colors.white),
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
