import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/core/constants/text.dart';
import 'package:trials/features/continue_register/data/data_source/purpose_data_source.dart';
import 'package:trials/features/continue_register/data/data_source/subscriptions_data_Source.dart';
import 'package:trials/features/continue_register/presentation/controller/materials/material_cubit.dart';
import 'package:trials/features/continue_register/presentation/controller/subscriptions/subscriptions_cubit.dart';
import 'package:trials/features/credit_card/data/payment_data_source.dart';
import 'package:trials/features/credit_card/presentation/controllers/payment_cubit.dart';
import 'package:trials/features/registration/data/data_source/register_data_source.dart';
import 'package:trials/features/registration/presentation/controller/Auth_cubit/register_cubit.dart';

import '../../../../core/constants/font_styles.dart';
import '../../../registration/presentation/controller/sign_up_controller.dart';
import '../../data/data_source/material_data_source.dart';
import '../../data/data_source/study_details_data_source.dart';
import '../../data/data_source/timing_data_source.dart';
import '../controller/Timing/timing_cubit.dart';
import '../controller/purposes/purposes_cubit.dart';
import '../controller/study_details/study_details_cubit.dart';
import 'stepper_screen.dart';

class ReservationsSalonPage extends StatelessWidget {
  final SignUpController controller;
  const ReservationsSalonPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: true,
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Align text to the start
                  children: [
                    Text(
                      AppText.elmadrash,
                      style: AppStyles.styleBold30(context: context, color: Colors.green),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      AppText.elmadrashCom,
                      style: AppStyles.styleRegular18(context: context, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MaterialCubit(MaterialData())),
              BlocProvider(create: (context) => PurposesCubit(PurposeData())),
              BlocProvider(create: (context) => TimingCubit(TimingData())..getTimings()),
              BlocProvider(create: (context) => PurposesCubit(PurposeData())..getPurpose()),
              BlocProvider(create: (context) => SubscriptionsCubit(SubscriptionData())..getSubscriptions()),
              BlocProvider(create: (context) => PaymentCubit(PaymentData())),
              BlocProvider(create: (context) => RegisterCubit(RegisterDataSource())),
              BlocProvider(create: (context) => StudyDetailsCubit(StudyDetailsData()),),
            ],
            child: StepperScreen(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}
