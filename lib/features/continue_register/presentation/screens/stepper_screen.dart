import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/controller/Timing/timing_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/materials/material_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/subscriptions/subscriptions_cubit.dart';
import 'package:trials/features/continue_register/presentation/screens/school_year_page.dart';
import 'package:trials/features/continue_register/presentation/screens/timing_screen.dart';
import '../../../../core/constants/font_styles.dart';
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
  int _currentStep = 1;
  final int _totalSteps = 8;

  final PageController _pageController = PageController();
  List<int> selectedSubjects = [];
  List<int> selectedGoals = [];
  List<int> selectedDays = [];
  String? studentCount;
  String? shift;
  String? timing;
  int? selectedSubscription;
  String? selectedClassCount;
  String? selectedClassHours;

  void _nextStep() async {
    if (_currentStep == 3) {
      if (selectedSubjects.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one subject')),
        );
        return;
      }
      BlocProvider.of<MaterialCubit>(context)
          .postMaterials(id: 792, materials: selectedSubjects);
    }

    if (_currentStep == 4) {
      if (selectedGoals.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one Goal')),
        );
        return;
      }
      if (studentCount == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select the number of students')),
        );
        return;
      }
      BlocProvider.of<PurposesCubit>(context)
          .postPurpose(id: 792, purposes: selectedGoals, count: studentCount!);
    }
    if (_currentStep == 5) {
      if (selectedDays.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one day')),
        );
        return;
      }
      if (shift == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select the number of shift')),
        );
        return;
      }
      if (timing == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select time')),
        );
        return;
      }
      BlocProvider.of<TimingCubit>(context).postTimings(
          id: 792, days: selectedDays, time: timing!, shift: shift!);
    }
    if (_currentStep == 6) {
      if (selectedSubscription== null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one selectedSubscription')),
        );
        return;
      }
      if (selectedClassCount == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select the number of selectedClassCount')),
        );
        return;
      }
      if (selectedClassHours == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select selectedClassHours')),
        );
        return;
      }
      BlocProvider.of<SubscriptionsCubit>(context).postSubscriptions(
          id: 792, subscription: selectedSubscription!, session: selectedClassCount!, hour: selectedClassHours!);
    }

    if (_currentStep < _totalSteps) {
      setState(() {
        _currentStep++;
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
        _pageController.previousPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Stepper Indicator
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    // Background Line
                    Container(
                      height: 10.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    // Progress Line
                    Stack(children: [
                      Container(
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        width: MediaQuery.of(context).size.width *
                            (_currentStep /
                                _totalSteps), // Adjust width to fill up to the current step
                      ),
                      if (_currentStep / _totalSteps != 1)
                        Positioned(
                            left: 0,
                            child: Container(
                              width: 5.0,
                              height: 5.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 2.5, horizontal: 3.5),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border()),
                            ))
                    ]),
                  ],
                )),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // Disable swipe
              children: [
                const ContactInfo(),
                const SchoolYearPage(),
                ChooseMaterialPage(
                  onSelectionChanged: (selectedIndexes) {
                    setState(() {
                      selectedSubjects = selectedIndexes;
                    });
                  },
                ),
                NumberStudentsGoalsPage(
                  onGoalSelectionChanged: (selectedIndexes) {
                    setState(() {
                      selectedGoals = selectedIndexes;
                    });
                  },
                  onStudentCountChanged: (count) {
                    setState(() {
                      studentCount = count.toString();
                    });
                  },
                ),
                TimingPage(
                  onDaysChanged: (List<int> value) {
                    setState(() {
                      selectedDays = value;
                      print('selectedDays: $selectedDays');
                    });
                  },
                  onPeriodChanged: (int? value) {
                    setState(() {
                      shift = value == 1 ? 'night' : 'day';
                      print('shift: $shift');
                    });
                  },
                  onTimingChanged: (int? value) {
                    setState(() {
                      timing = value == 1
                          ? '15:00'
                          : '12:00'; // Update timing based on selected value
                      print('timing: $timing');
                    });
                  },
                ),
                ClassesTimePage(
                  onClassCountChanged: (int? value) {
                    setState(() {
                      selectedClassCount = value == 1 ? 'one' : 'two';

                      print(
                          'Selected Subscription in StepperScreen: $selectedClassCount');
                    });
                  },
                  onClassHoursChanged: (String? value) {
                    setState(() {
                      selectedClassHours = value;
                      print(
                          'Selected Subscription in StepperScreen: $selectedClassHours');
                    });
                  },
                  onSubscriptionChanged: (int? value) {
                    setState(() {
                      selectedSubscription = value;
                      print(
                          'Selected Subscription in StepperScreen: $selectedSubscription');
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    // Padding
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.green, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                  ),
                  onPressed: _previousStep,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.double_arrow_sharp,
                        color: Colors.green,
                      ),
                      Text(
                        ' السابق',
                        style: AppStyles.style60016(
                            context: context, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                if (_currentStep < _totalSteps)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                    ),
                    onPressed: _nextStep,
                    child: Row(
                      children: [
                        Text(
                          'التالي',
                          style: AppStyles.style60016(
                              context: context, color: Colors.white),
                        ),
                        Transform.rotate(
                          angle:
                              3.14, // Rotate the icon 180 degrees to face left
                          child: const Icon(
                            Icons.double_arrow_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
