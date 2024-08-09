

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import '../../../../core/api.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/shared_pref.dart';

class StudyDetailsData {

  Future postStudyDetailss({required List<String> stage,required List<String> classroom,required List<String> courseStudy}) async {
    try {
      final id = await getString('id');
      FormData formData = FormData.fromMap({
        'form': id,
        'course_study': courseStudy,
        'stage':stage,
        'classroom':classroom,
      });

      var response = await Api().post(
        url: '${AppConstants().baseUrl}specify/',
        formData: formData,
      );

      int data = response['form'];
      debugPrint('$data');
      return data.toString();
    } catch (e) {
      debugPrint('Error: $e');
      rethrow; // Rethrow the caught exception to propagate it up the call stack
    }
  }

}
