import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trials/features/continue_register/data/models/purpose_model.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_state.dart';

import '../../../data/data_source/purpose_data_source.dart';

class PurposesCubit extends Cubit<PurposesState> {
  PurposeData api;
  String? message;
  List<PurposeModel>? data;
  PurposesCubit(this.api) : super(PurposeInitial());

  void getPurpose() async {
    emit(PurposeLoading());
    try {
      data = await api.getPurposes();
      emit(PurposeSuccess(
        data: data,
      ));
    } on Exception catch (e, stackTrace) {
      emit(PurposeFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');
    }
  }

  postPurpose({required List<int> purposes, required String count}) async {
    emit(PurposeLoading());
    try {
      message = await api.postPurposes(studentCount: count, purposes: purposes);
      emit(PostPurposeSuccess(
        message: message,
      ));
      return true;
    } on Exception catch (e, stackTrace) {
      emit(PurposeFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');
      return false;
    }
  }
}
