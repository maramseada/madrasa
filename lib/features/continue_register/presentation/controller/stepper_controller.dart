import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/core/constants/font_styles.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/study_details/study_details_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/subscriptions/subscriptions_cubit.dart';
import 'package:trials/features/credit_card/presentation/controllers/payment_cubit.dart';
import 'package:trials/features/registration/presentation/controller/Auth_cubit/register_cubit.dart';

import '../../../registration/presentation/controller/sign_up_controller.dart';
import 'Timing/timing_cubit.dart';
import 'materials/material_cubit.dart';

class StepperCubit extends Cubit<int> {
  StepperCubit(this.signUpController) : super(1);
  final int totalSteps = 8;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  SignUpController signUpController;
  List<int> selectedSubjects = [];
  List<String> selectedCourseStudy = [];
  List<String> selectedYear = [];
  List<String> selectedLevel = [];
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

  Future<void> nextStep(BuildContext context) async {
    bool success = true;

    switch (state) {
      case 1:
        success = await BlocProvider.of<RegisterCubit>(context).register(
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
      case 2:        if (selectedLevel.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text('برجاء اختيار المرحلة الدراسية',
                style: AppStyles.style40016(context: context, color: Colors.white),)),

        );
        return;
      }     if (selectedYear.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text('برجاء اختيار السنة الدراسية',
                style: AppStyles.style40016(context: context, color: Colors.white),)),

        );
        return;
      }     if (selectedCourseStudy.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.green,
              content: Text('برجاء اختيار المنهج الدراسي ',
                style: AppStyles.style40016(context: context, color: Colors.white),)),

        );
        return;
      }   success = await BlocProvider.of<StudyDetailsCubit>(context).postStudyDetails(stage: selectedLevel, classroom: selectedYear, courseStudy: selectedCourseStudy);
        break;
      case 3:
        if (selectedSubjects.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء اختيار المواد الدراسية',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        success = await BlocProvider.of<MaterialCubit>(context).postMaterials(materials: selectedSubjects);
        break;
      case 4:
        if (selectedGoals.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال هدف واحد على الاقل',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),
          );
          return;
        }
        if (studentCount == null) {
          ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال عدد الطلاب',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),
          );
          return;
        }
        success = await BlocProvider.of<PurposesCubit>(context).postPurpose(purposes: selectedGoals, count: studentCount!);
        break;
      case 5:
        if (selectedDays.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال الايام المناسبة لك',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),
          );
          return;
        }
        if (shift == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال الفترة الزمنية المناسبة لك',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),
          );
          return;
        }
        if (timing == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال التوقيت المناسبة لك',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        success = await BlocProvider.of<TimingCubit>(context).postTimings(days: selectedDays, time: timing!, shift: shift!);
        break;
      case 6:
        if (selectedSubscription == null) {
          ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال مده الاشتراك المناسبة لك',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        if (selectedClassCount == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال عدد الحصص اسبوعيا المناسب لك',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        if (selectedClassHours == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال عدد ساعات الحصة الواحدة المناسب لك',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        success = await BlocProvider.of<SubscriptionsCubit>(context).postSubscriptions(subscription: selectedSubscription!, session: selectedClassCount!, hour: selectedClassHours!);
        break;
      case 7:
        if (cvc == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال رمز الحماية',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        if (numberCard == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال رقم البطاقة',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        if (expDateCard == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال تاريخ انتهاء الصلاحية',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),

          );
          return;
        }
        if (cardName == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.green,
                content: Text('برجاء ادخال الاسم على البطاقة',
                  style: AppStyles.style40016(context: context, color: Colors.white),)),
          );
          return;
        }
        success = await BlocProvider.of<PaymentCubit>(context).pay( cvc: cvc!, numberCard: numberCard!, expDate: expDateCard!, name: cardName!);
        break;
    }
if(success == false){
  ScaffoldMessenger.of(context).showSnackBar(
    
     SnackBar(
        backgroundColor: Colors.green,
        content: Text('يوجد مشكلة في الاتصال بالانترنت الرجاء المحاولة لاحقا',
          style: AppStyles.style40016(context: context, color: Colors.white),)),
  );
}
    if (success && state < totalSteps) {
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
