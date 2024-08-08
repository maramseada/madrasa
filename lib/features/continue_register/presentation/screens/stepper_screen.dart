import 'package:flutter/material.dart';
import 'package:trials/features/continue_register/presentation/screens/school_year_page.dart';
import 'package:trials/features/continue_register/presentation/screens/timing_screen.dart';

import '../components/navigations_buttons.dart';
import '../components/stepper_indicator.dart';
import '../controller/stepper_controller.dart';
import 'choose_material_page.dart';
import 'classes_time.dart';
import 'contact_info_page.dart';
import 'number_students_goals_page.dart';


class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  late StepperController _controller;

  @override
  void initState() {
    super.initState();
    _controller = StepperController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          StepperIndicator(
            currentStep: _controller.currentStep,
            totalSteps: _controller.totalSteps,
          ),
          Expanded(
            child: PageView(
              controller: _controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const ContactInfo(),
                const SchoolYearPage(),
                ChooseMaterialPage(
                  onSelectionChanged: (selectedIndexes) {
                    setState(() {
                      _controller.selectedSubjects = selectedIndexes;
                    });
                  },
                ),
                NumberStudentsGoalsPage(
                  onGoalSelectionChanged: (selectedIndexes) {
                    setState(() {
                      _controller.selectedGoals = selectedIndexes;
                    });
                  },
                  onStudentCountChanged: (count) {
                    setState(() {
                      _controller.studentCount = count.toString();
                    });
                  },
                ),
                TimingPage(
                  onDaysChanged: (List<int> value) {
                    setState(() {
                      _controller.selectedDays = value;
                    });
                  },
                  onPeriodChanged: (int? value) {
                    setState(() {
                      _controller.shift = value == 1 ? 'night' : 'day';
                    });
                  },
                  onTimingChanged: (int? value) {
                    setState(() {
                      _controller.timing = value == 1 ? '15:00' : '12:00';
                    });
                  },
                ),
                ClassesTimePage(
                  onClassCountChanged: (int? value) {
                    setState(() {
                      _controller.selectedClassCount = value == 1 ? 'one' : 'two';
                    });
                  },
                  onClassHoursChanged: (String? value) {
                    setState(() {
                      _controller.selectedClassHours = value;
                    });
                  },
                  onSubscriptionChanged: (int? value) {
                    setState(() {
                      _controller.selectedSubscription = value;
                    });
                  },
                ),
              ],
            ),
          ),
          NavigationButtons(
            currentStep: _controller.currentStep,
            totalSteps: _controller.totalSteps,
            onPrevious: () => _controller.previousStep(),
            onNext: () => _controller.nextStep(context),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.pageController.dispose();
    super.dispose();
  }
}
