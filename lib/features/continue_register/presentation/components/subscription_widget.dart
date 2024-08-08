import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trials/core/constants/colors.dart';
import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/core/constants/text.dart';
import 'package:trials/features/continue_register/data/models/supscription_model.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SubscriptionWidget extends StatelessWidget {
  final SubscriptionModel data;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  const SubscriptionWidget({
    super.key,
    this.selectedIndex,
    required this.onSelected,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(data.id);
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
          color: Colors.white,
          border: Border.all(
            color: data.id == selectedIndex ? Colors.green : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(AppColors.palePinkColor),
              ),
              child: Center(
                child: Text(
                  '${data.discount}%',
                  style: AppStyles.style60016(
                    context: context,
                    color: Color(AppColors.pinkColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              data.arabicTerm,
              style: AppStyles.style40016(
                context: context,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              data.arabicPeriod,
              style: AppStyles.styleRegular14(
                context: context,
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${data.price}${AppText.derham}',
                    style: AppStyles.styleBold14(
                      context: context,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
