import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';
import '../components/Days_slivers.dart';
import '../components/period_slivers.dart';
import '../components/time_slivers.dart';

class TimingPage extends StatefulWidget {
  final ValueChanged<List<int>> onDaysChanged;
  final ValueChanged<int?> onPeriodChanged;
  final ValueChanged<int?> onTimingChanged;

  const TimingPage({
    super.key,
    required this.onDaysChanged,
    required this.onPeriodChanged,
    required this.onTimingChanged,
  });

  @override
  State<TimingPage> createState() => _TimingPageState();
}

class _TimingPageState extends State<TimingPage> {
  List<int> selectedDays = [];
  int? studentCount;

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
                        AppText.chooseTiming,
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
                AppText.suitableDays,
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          DaysSliver(
            onGoalSelectionChanged: (selectedIndexes) {
              setState(() {
                selectedDays = selectedIndexes;
                widget.onDaysChanged(selectedDays); // Notify parent about the selection
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
                AppText.chooseSchoolGoalsShort,
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          PeriodSlivers(
            onPeriodChanged: widget.onPeriodChanged, // Pass callback to PeriodSlivers
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
                AppText.chooseTimeShort,
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          TimeSlivers(
            onTimeChanged: widget.onTimingChanged, // Pass callback to TimeSlivers
          ),
        ],
      ),
    );
  }
}
