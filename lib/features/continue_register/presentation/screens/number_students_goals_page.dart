import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/data/data_source/purpose_data_source.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../core/constants/font_size.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';
import '../../data/models/purpose_model.dart';
import '../components/purposes_widget.dart';
import '../components/student_number_slivers.dart';
import '../controller/purposes/purposes_cubit.dart';
import '../controller/purposes/purposes_state.dart';

class NumberStudentsGoalsPage extends StatefulWidget {
  final ValueChanged<List<int>> onGoalSelectionChanged;
  final ValueChanged<int?> onStudentCountChanged;

  const NumberStudentsGoalsPage({
    super.key,
    required this.onGoalSelectionChanged,
    required this.onStudentCountChanged,
  });

  @override
  State<NumberStudentsGoalsPage> createState() =>
      _NumberStudentsGoalsPageState();
}

class _NumberStudentsGoalsPageState extends State<NumberStudentsGoalsPage> {
  List<int> selectedGoals = [];
  int? studentCount;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PurposesCubit(PurposeData())..getPurpose()),
      ],
      child: Padding(
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
                          AppText.chooseSchoolYear,
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
                  AppText.studentCount,
                  style: AppStyles.styleBold18(context: context),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            StudentNumberSlivers(
              onSelectionChanged: (selectedStudentCount) {
                setState(() {
                  studentCount = selectedStudentCount;
                  widget.onStudentCountChanged(
                      studentCount); // Notify parent about the selection
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
            PurposesSliver(
              onGoalSelectionChanged: (selectedIndexes) {
                setState(() {
                  selectedGoals = selectedIndexes;
                  widget.onGoalSelectionChanged(
                      selectedGoals); // Notify parent about the selection
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
