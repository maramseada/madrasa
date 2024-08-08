import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/core/constants/text.dart';
import 'package:trials/features/continue_register/presentation/controller/material_cubit.dart';

import '../../../../core/constants/font_styles.dart';
import '../../data/data_source/material_data_source.dart';
import 'stepper_screen.dart';

class ReservationsSalonPage extends StatelessWidget {
  const ReservationsSalonPage({super.key});

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
          body:
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MaterialCubit(MaterialData())),
             // BlocProvider(create: (context) => OrdersSalonExpiredCubit(OrdersDataSource())),
            ],
           child:

          StepperScreen(),
          ),
        ),
      ),
    );
  }
}