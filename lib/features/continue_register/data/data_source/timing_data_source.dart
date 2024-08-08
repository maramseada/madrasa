

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/api.dart';
import '../../../../core/constants/app_constants.dart';
import '../models/day_model.dart';

class TimingData {
  Future getTimings() async {
    try {
      var response = await Api().get(
        url: '${AppConstants().baseUrl}day/',
        formData: null,
      );

      List<dynamic> responseData = response; // Assuming 'data' is a list
      List<DaysModel> products =
      responseData.map((item) => DaysModel.fromJson(item)).toList();
      debugPrint('$products');
      return products;
    } catch (e) {
      print('Error loading profile data: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }

Future postTimings({required int id, required String time, required String shift, required List<int>days}) async {
  try {
    FormData formData = FormData.fromMap({
      'form': id,
      'time': time,
      'day':days,
      'shift': shift,
    });

    var response = await Api().post(
      url: '${AppConstants().baseUrl}period/',
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