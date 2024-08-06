import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_styles.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return         WidgetAnimator(
        incomingEffect: WidgetTransitionEffects.incomingSlideInFromBottom(
          duration: const Duration(seconds: 1),
        ),
        atRestEffect: WidgetRestingEffects.none(),
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تسجيل الدخول ',
                style: AppStyles.style40016(
                    context: context, color: Colors.green),
              ),
              Text('ليس لديك حساب؟',
                  style: AppStyles.style40016(context: context)),
            ],
          ),
        )   );
  }
}
