
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/data/models/day_model.dart';
import 'package:trials/features/continue_register/presentation/controller/Timing/timing_state.dart';

import '../../../data/data_source/timing_data_source.dart';

class TimingCubit extends Cubit<TimingState> {
  TimingData api;
  String? message;
  List<DaysModel>? data;
  TimingCubit(this.api) : super(TimingInitial());

  void getTimings() async {
    emit(TimingLoading());
    try {
      data = await api.getTimings();
      emit(TimingSuccess(
        data: data,
      ));
      print('nlkesfnefn$message');
    } on Exception catch (e, stackTrace) {
      emit(TimingFailure(errMessage: 'error: $e'));
      print(e);
      print(stackTrace);
    }
  }

  void postTimings(
      {required int id,
      required List<int> days,
      required String shift,
      required String time}) async {
    emit(TimingLoading());
    try {
      message = await api.postTimings(
        id: id,
        time: time,
        shift: shift,
        days: days,
      );
      emit(TimingSuccess(
        message: message,
      ));
      print('nlkesfnefn$message');
    } on Exception catch (e, stackTrace) {
      emit(TimingFailure(errMessage: 'error: $e'));
      print(e);
      print(stackTrace);
    }
  }
}
