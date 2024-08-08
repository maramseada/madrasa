

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/credit_card/presentation/controllers/payment_state.dart';

import '../../data/payment_data_source.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentData api;
  String? message;
  PaymentCubit(this.api) : super(PaymentInitial());

  void pay({

    required int cvc,
    required String numberCard,
    required String expDate,
    required String name,
    required int id,
}) async {
    emit(PaymentLoading());
    try {
      message = await api.pay(cvc: cvc, numberCard: numberCard, expDate: expDate, name: name, id: id);
      emit(PaymentSuccess(
        message: message,
      ));
      debugPrint('nlkesfnefn$message');
    } on Exception catch (e, stackTrace) {
      emit(PaymentFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');
    }
  }


}