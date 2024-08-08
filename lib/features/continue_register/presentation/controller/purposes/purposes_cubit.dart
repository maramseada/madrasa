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
      print('nlkesfnefn$message');
    } on Exception catch (e, stackTrace) {
      emit(PurposeFailure(errMessage: 'error: $e'));
      print(e);
      print(stackTrace);
    }
  }

  void postPurpose({required int id, required List<int> purposes, required String count}) async {
    emit(PurposeLoading());
    try {
      message = await api.postPurposes(id: id, studentCount: count, purposes: purposes);
      emit(PostPurposeSuccess(
        message: message,
      ));
      print('nlkesfnefn$message');
    } on Exception catch (e, stackTrace) {
      emit(PurposeFailure(errMessage: 'error: $e'));
      print(e);
      print(stackTrace);
    }
  }
}
