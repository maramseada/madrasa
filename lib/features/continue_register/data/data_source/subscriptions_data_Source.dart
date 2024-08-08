
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/api.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/supscription_model.dart';

class SubscriptionData {
  Future getSubscriptions() async {
    try {
      var response = await Api().get(
        url: '${AppConstants().baseUrl}subsription/',
        formData: null,
      );

      List<dynamic> responseData = response; // Assuming 'data' is a list
      List<SubscriptionModel> products =
      responseData.map((item) => SubscriptionModel.fromJson(item)).toList();
      debugPrint('$products');
      return products;
    } catch (e) {
      print('Error loading profile data: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }

  Future postSubscriptions({required int id, required String hour, required String session, required int subscription}) async {
    try {
      FormData formData = FormData.fromMap({
        'form': id,
        'hour': hour,
        'subscription':subscription,
        'session': session,
      });

      var response = await Api().post(
        url: '${AppConstants().baseUrl}class/',
        formData: formData,
      );

      int data = response['form'];
      debugPrint('$data');
      return data.toString();
    } catch (e) {
      print('Error loading profile data: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }

}