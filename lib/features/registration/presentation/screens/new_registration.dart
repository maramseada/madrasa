import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:trials/core/constants/components/button_widget.dart';
import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/core/constants/images.dart';
import 'package:trials/core/constants/navigator.dart';
import 'package:trials/core/constants/text.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../../../../core/constants/font_size.dart';
import '../../../continue_register/presentation/screens/continue_register.dart';
import '../components/email_text_field.dart';
import '../components/family_name_text_field.dart';
import '../components/name_text_field.dart';
import '../components/new_register_component.dart';
import '../components/other_options_register_with_widget.dart';
import '../components/password_text_field.dart';

class NewRegistration extends StatelessWidget {
  const NewRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveFontSize(context, fontSize: 15)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 30),
                ),
                const NewRegisterComponent(),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                NameTextField(
                  hintText: AppText.name,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                FamilyNameTextField(
                  hintText: AppText.familyName,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                EmailTextField(
                  hintText: AppText.email,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                PasswordTextField(
                  onChanged: (value) {},
                  hintText: AppText.password,
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                PasswordTextField(
                  onChanged: (value) {},
                  hintText: AppText.confirmPassword,
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(context, const ReservationsSalonPage());
                  },
                  child: ButtonWidget(
                      widget: Text(
                    AppText.newRegister,
                    style: AppStyles.styleBold16(
                        context: context, color: Colors.white),
                  )),
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromLeft(
                    duration: const Duration(seconds: 1),
                  ),
                  atRestEffect: WidgetRestingEffects.none(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Expanded(
                          child: Divider(thickness: 1, color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(AppText.orRegister,
                            style: AppStyles.style40016(context: context)),
                      ),
                      const Expanded(
                          child: Divider(thickness: 1, color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromRight(
                    duration: const Duration(seconds: 1),
                  ),
                  atRestEffect: WidgetRestingEffects.none(),
                  child: OtherOptionsRegisterWithWidget(
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.google,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Google')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 10),
                ),
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromLeft(
                    duration: const Duration(seconds: 1),
                  ),
                  atRestEffect: WidgetRestingEffects.none(),
                  child: OtherOptionsRegisterWithWidget(
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.apple),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Apple',
                          style: AppStyles.style60016(context: context),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getResponsiveFontSize(context, fontSize: 15),
                ),
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromBottom(
                    duration: const Duration(seconds: 1),
                  ),
                  atRestEffect: WidgetRestingEffects.none(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppText.login,
                        style: AppStyles.style40016(
                            context: context, color: Colors.green),
                      ),
                      Text(
                        AppText.doYouHAveAnAccount,
                        style: AppStyles.style40016(context: context),
                      ),
                    ],
                  ),
                )
              ])),
    )));
  }
}
