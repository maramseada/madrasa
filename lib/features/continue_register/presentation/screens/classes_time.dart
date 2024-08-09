import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';
import '../components/class_hours.dart';
import '../components/class_hours_slivers.dart';
import '../components/classes_per_week_Sliver.dart';
class ClassesTimePage extends StatefulWidget {
  final ValueChanged<String?> onClassHoursChanged;
  final ValueChanged<int?> onClassCountChanged;
  final ValueChanged<int?> onSubscriptionChanged; // New callback for subscription

  const ClassesTimePage({
    super.key,
    required this.onClassHoursChanged,
    required this.onClassCountChanged,
    required this.onSubscriptionChanged, // Add the new parameter
  });

  @override
  State<ClassesTimePage> createState() => _ClassesTimePageState();
}

class _ClassesTimePageState extends State<ClassesTimePage> {
  int? classPerWeek;
  String? classHours;
  int? selectedSubscription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: getResponsiveFontSize(context, fontSize: 15),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.yellow,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      child: Text(
                        textAlign: TextAlign.right,
                        AppText.chooseSubscription,
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Text(
                AppText.classesAWeek,
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          ClassesPerWeekSlivers(
            onClassesPerWeekChanged: (selectedClassCount) {
              setState(() {
                classPerWeek = selectedClassCount;
                widget.onClassCountChanged(classPerWeek); // Notify parent about the selection
              });
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Text(
                AppText.classHours,
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          ClassHoursSlivers(
            onClassHoursChanged: (selectedTime) {
              setState(() {
                classHours = selectedTime;
                widget.onClassHoursChanged(classHours); // Notify parent about the selection
              });
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Text(
                AppText.subscriptionTime,
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: SubscriptionsSlivers(
              onSubScriptionsChanged: (int? value) {
                setState(() {
                  selectedSubscription = value;
                  widget.onSubscriptionChanged(selectedSubscription); // Notify parent about the selection
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
