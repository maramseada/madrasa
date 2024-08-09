
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/shared_pref.dart';

class PaymentData {
  Future<String> pay({
    required int cvc,
    required String numberCard,
    required String expDate,
    required String name,
  }) async {
    try {
      final id = await getString('id');

      FormData formData = FormData.fromMap({
        "card_number": numberCard,
        "cvc": cvc,
        "exp_date": expDate,
        "card_holder": name,
        "form": id, // form id from (step one)
      });

      var response = await Dio().post(
        '${AppConstants().baseUrl}pay/',
        data: formData,
      );

      int data = response.data['form'];
      debugPrint('$data');
      return data.toString();
    } catch (e) {
      print('Error processing payment: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }
}
