import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trials/features/continue_register/data/models/purpose_model.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_state.dart';
import 'package:trials/features/continue_register/presentation/controller/study_details/study_details_state.dart';

import '../../../data/data_source/purpose_data_source.dart';
import '../../../data/data_source/study_details_data_source.dart';

class StudyDetailsCubit extends Cubit<StudyDetailsState> {
  StudyDetailsData api;
  String? message;
  StudyDetailsCubit(this.api) : super(StudyDetailsInitial());



  postStudyDetails({required List<String> stage,required List<String> classroom,required List<String> courseStudy,
}) async {
    emit(StudyDetailsLoading());
    try {
      message = await api.postStudyDetailss(stage: stage, classroom: classroom, courseStudy: courseStudy);
      emit(PostStudyDetailsSuccess(
        message: message,
      ));
      return true;
    } on Exception catch (e, stackTrace) {
      emit(StudyDetailsFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');
      return false;
    }
  }
}
