import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/subscriptions/subscriptions_cubit.dart';
import 'package:trials/features/credit_card/presentation/controllers/payment_cubit.dart';
import 'package:trials/features/registration/presentation/controller/Auth_cubit/register_cubit.dart';

import '../../../registration/presentation/controller/sign_up_controller.dart';
import 'Timing/timing_cubit.dart';
import 'materials/material_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StepperCubit extends Cubit<int> {
  StepperCubit(this.signUpController) : super(1);
  final int totalSteps = 8;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  SignUpController signUpController;
  List<int> selectedSubjects = [];
  List<int> selectedGoals = [];
  List<int> selectedDays = [];
  String? studentCount;
  String? shift;
  String? timing;
  int? selectedSubscription;
  String? selectedClassCount;
  String? selectedClassHours;
  int? cvc;
  String? numberCard;
  String? expDateCard;
  String? cardName;

  void nextStep(BuildContext context) async {
    switch (state) {
      case 1:




        BlocProvider.of<RegisterCubit>(context).pay(
          firstName: signUpController.name!,
          secondName: signUpController.familyName!,
          whatsapp: signUpController.phone!,
          email: signUpController.email!,
          age: signUpController.selectedBirthday != null ? (DateTime.now().year - signUpController.selectedBirthday!.year).toInt() : null,
          gender: signUpController.selectedGender,
          nationality: signUpController.selectedNationality,
          difficulties: signUpController.selectedDisability,
          description: signUpController.additionalNotes,
        );
        break;
      case 2:
        break;
      case 3:
        if (selectedSubjects.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select at least one subject')),
          );
          return;
        }
        BlocProvider.of<MaterialCubit>(context).postMaterials(id: 792, materials: selectedSubjects);
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
        BlocProvider.of<PurposesCubit>(context).postPurpose(id: 792, purposes: selectedGoals, count: studentCount!);
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
        BlocProvider.of<TimingCubit>(context).postTimings(id: 792, days: selectedDays, time: timing!, shift: shift!);
        break;
      case 6:
        if (selectedSubscription == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select at least one subscription')),
          );
          return;
        }
        if (selectedClassCount == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select the number of class count')),
          );
          return;
        }
        if (selectedClassHours == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select class hours')),
          );
          return;
        }
        BlocProvider.of<SubscriptionsCubit>(context).postSubscriptions(id: 792, subscription: selectedSubscription!, session: selectedClassCount!, hour: selectedClassHours!);
        break;
      case 7:
        if (cvc == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter CVC')),
          );
          return;
        }
        if (numberCard == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter card number')),
          );
          return;
        }
        if (expDateCard == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter expiration date')),
          );
          return;
        }
        if (cardName == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter card name')),
          );
          return;
        }
        BlocProvider.of<PaymentCubit>(context).pay(id: 793, cvc: cvc!, numberCard: numberCard!, expDate: expDateCard!, name: cardName!);
        break;
    }

    if (state < totalSteps) {
      emit(state + 1);
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void previousStep() {
    if (state > 1) {
      emit(state - 1);
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}

