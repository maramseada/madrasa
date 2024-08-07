import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_size.dart';

class RegisterNewAnimatingText extends StatelessWidget {
  final  Color color;
  final String text;

  const RegisterNewAnimatingText({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
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
              child:  Text(
                textAlign: TextAlign.right,
                text,
                maxLines: 4,
              ),
            ),
            const Spacer(),
            Container(
              width: 10,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
