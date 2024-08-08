import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/subscriptions/subscriptions_cubit.dart';

import 'Timing/timing_cubit.dart';
import 'materials/material_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepperController extends ChangeNotifier {
  int _currentStep = 1;
  int get currentStep => _currentStep;

  final int _totalSteps = 8;
  int get totalSteps => _totalSteps;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  List<int> selectedSubjects = [];
  List<int> selectedGoals = [];
  List<int> selectedDays = [];
  String? studentCount;
  String? shift;
  String? timing;
  int? selectedSubscription;
  String? selectedClassCount;
  String? selectedClassHours;

  void nextStep(BuildContext context) async {
    switch (_currentStep) {
      case 3:
        if (selectedSubjects.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select at least one subject')),
          );
          return;
        }
        BlocProvider.of<MaterialCubit>(context)
            .postMaterials(id: 792, materials: selectedSubjects);
        break;

      case 4:
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
        break;

      case 5:
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
        break;

      case 6:
        if (selectedSubscription == null) {
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
        break;
    }

    if (_currentStep < _totalSteps) {
      _currentStep++;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 1) {
      _currentStep--;
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      notifyListeners();
    }
  }
}
