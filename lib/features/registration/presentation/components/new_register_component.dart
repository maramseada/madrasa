import 'package:flutter/cupertino.dart';
import 'package:trials/core/constants/text.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_styles.dart';

class NewRegisterComponent extends StatelessWidget {
  const NewRegisterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return               WidgetAnimator(
      incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
        duration: const Duration(seconds: 1),
      ),
      atRestEffect: WidgetRestingEffects.none(),
      child: Text(
   AppText.newRegister,
        style: AppStyles.styleBold30(context: context),
      ),
    );
  }
}
