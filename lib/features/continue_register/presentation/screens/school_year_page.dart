import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/core/constants/text.dart';
import 'package:trials/features/continue_register/presentation/components/school_level_sliver.dart';
import 'package:trials/features/continue_register/presentation/components/school_subject_sliver.dart';
import 'package:trials/features/continue_register/presentation/components/school_year_sliver.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_size.dart';
import '../controller/stepper_controller.dart';

class SchoolYearPage extends StatelessWidget {
  const SchoolYearPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<StepperCubit>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CustomScrollView(
        slivers: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: SliverToBoxAdapter(
                child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: getResponsiveFontSize(context, fontSize: 15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      child: Text(
                        textAlign: TextAlign.right,
                        AppText.chooseSchoolYear,
                        maxLines: 4,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 10,
                      height: 80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.yellow),
                    ),
                  ],
                ),
              ),
            )),
          ),
          SliverToBoxAdapter(
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
                duration: const Duration(seconds: 1),
              ),
              atRestEffect: WidgetRestingEffects.none(),
              child: Text(
                'حدد المرحلة الدراسية',
                style: AppStyles.styleBold18(context: context),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SchoolLevelSliver(     onSelectionChanged: (selectedValues) {
            cubit.selectedLevel = selectedValues; // Update Cubit with selected values

            print(cubit.selectedLevel);
          },),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'حدد السنة الدراسية',
              style: AppStyles.styleBold18(context: context),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SchoolYearSliver(     onSelectionChanged: (selectedValues) {
            cubit.selectedYear = selectedValues; // Update Cubit with selected values

            print(cubit.selectedYear);
          },),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'حدد المنهج الدراسية',
              style: AppStyles.styleBold18(context: context),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        SchoolSubjectSliver(
        onSelectionChanged: (selectedValues) {
              cubit.selectedCourseStudy = selectedValues; // Update Cubit with selected values

              print(cubit.selectedCourseStudy);
        },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
        ],
      ),
    );
  }
}
