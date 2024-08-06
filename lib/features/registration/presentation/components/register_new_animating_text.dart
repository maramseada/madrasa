import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_size.dart';

class RegisterNewAnimatingText extends StatelessWidget {
  const RegisterNewAnimatingText({super.key});

  @override
  Widget build(BuildContext context) {
    return          WidgetAnimator(
      incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
        duration: const Duration(seconds: 1),
      ),
      atRestEffect: WidgetRestingEffects.none(),
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: getResponsiveFontSize(context, fontSize: 15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.85,
              child: const Text(
                textAlign: TextAlign.right,
                'هل انت طالب تسعى الي توسيع افاقك و فتح ابواب المعرفة؟ أم ولي أمر تود متابعة رحلة ابنك المستقبلية ودعمة فب اكتشاف شغفة',
                maxLines: 4,
              ),
            ),
            const Spacer(),
            Container(
              width: 10,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
