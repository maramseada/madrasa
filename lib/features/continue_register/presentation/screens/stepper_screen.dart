import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/screens/school_year_page.dart';
import 'package:trials/features/continue_register/presentation/screens/timing_screen.dart';

import '../../../credit_card/presentation/screens/credit_card_screen.dart';
import '../../../registration/presentation/controller/sign_up_controller.dart';
import '../components/navigations_buttons.dart';
import '../components/stepper_indicator.dart';
import '../controller/stepper_controller.dart';
import 'choose_material_page.dart';
import 'classes_time.dart';
import 'contact_info_page.dart';
import 'final_screen.dart';
import 'number_students_goals_page.dart';

class StepperScreen extends StatelessWidget {
final SignUpController controller;

  const StepperScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StepperCubit(controller),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            BlocBuilder<StepperCubit, int>(
              builder: (context, currentStep) {
                final cubit = context.read<StepperCubit>();
                return StepperIndicator(
                  currentStep: currentStep,
                  totalSteps: cubit.totalSteps,
                );
              },
            ),
            Expanded(
              child: BlocBuilder<StepperCubit, int>(
                builder: (context, currentStep) {
                  final cubit = context.read<StepperCubit>();
                  return PageView(
                    controller: cubit.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                       ContactInfo(controller: controller,),
                      const SchoolYearPage(


                      ),
                      ChooseMaterialPage(
                        onSelectionChanged: (selectedIndexes) {
                          cubit.selectedSubjects = selectedIndexes;
                        },
                      ),
                      NumberStudentsGoalsPage(
                        onGoalSelectionChanged: (selectedIndexes) {
                          cubit.selectedGoals = selectedIndexes;
                        },
                        onStudentCountChanged: (count) {
                          cubit.studentCount = count.toString();
                        },
                      ),
                      TimingPage(
                        onDaysChanged: (List<int> value) {
                          cubit.selectedDays = value;
                        },
                        onPeriodChanged: (int? value) {
                          cubit.shift = value == 1 ? 'night' : 'day';
                        },
                        onTimingChanged: (int? value) {
                          cubit.timing = value == 1 ? '15:00' : '12:00';
                        },
                      ),
                      ClassesTimePage(
                        onClassCountChanged: (int? value) {
                          cubit.selectedClassCount = value == 1 ? 'one' : 'two';
                        },
                        onClassHoursChanged: (String? value) {
                          cubit.selectedClassHours = value;
                        },
                        onSubscriptionChanged: (int? value) {
                          cubit.selectedSubscription = value;
                        },
                      ),
                      CreditCardScreen(
                        onCardNumberChanged: (String? value) {
                          cubit.numberCard = value == 1 ? 'one' : 'two';
                        },
                        onCardNameChanged: (String? value) {
                          cubit.cardName = value;
                        },
                        onPinChanged: (int? value) {
                          cubit.cvc = value;
                        },
                        onExpDateChanged: (String? value) {
                          cubit.expDateCard = value;
                        },
                      ),
                      FinalScreen(),
                    ],
                  );
                },
              ),
            ),
            BlocBuilder<StepperCubit, int>(
              builder: (context, currentStep) {
                final cubit = context.read<StepperCubit>();
                return NavigationButtons(
                  currentStep: currentStep,
                  totalSteps: cubit.totalSteps,
                  onPrevious: () => cubit.previousStep(),
                  onNext: () => cubit.nextStep(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
