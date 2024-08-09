
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/api.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/shared_pref.dart';
import '../models/purpose_model.dart';

class PurposeData {
  Future getPurposes() async {
    try {
      var response = await Api().get(
        url: '${AppConstants().baseUrl}purpose/',
        formData: null,
      );

      List<dynamic> responseData = response; // Assuming 'data' is a list
      List<PurposeModel> data =
      responseData.map((item) => PurposeModel.fromJson(item)).toList();
      debugPrint('$data');
      return data;
    } catch (e) {
      print('Error loading profile data: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }

Future postPurposes({required String studentCount,  required List<int> purposes}) async {
  try {
    final id = await getString('id');


    FormData formData = FormData.fromMap({
      'student_count':studentCount,
      'form': id,
      'purposes': purposes,
    });
    var response = await Api().post(
      url: '${AppConstants().baseUrl}count/',
      formData: formData,
    );

    int data = response['id'];
    debugPrint('$data');
    return data.toString();
  } catch (e) {
    print('Error loading profile data: $e');
    rethrow; // Rethrow the caught exception to propagate it up the call stack
  }
}

}