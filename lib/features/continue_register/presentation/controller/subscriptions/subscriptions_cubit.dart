import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/continue_register/data/data_source/subscriptions_data_Source.dart';

import 'package:trials/features/continue_register/data/models/purpose_model.dart';
import 'package:trials/features/continue_register/presentation/controller/purposes/purposes_state.dart';
import 'package:trials/features/continue_register/presentation/controller/subscriptions/subscriptions_state.dart';

import '../../../data/data_source/purpose_data_source.dart';
import '../../../data/models/supscription_model.dart';

class SubscriptionsCubit extends Cubit<SubscriptionsState> {
  SubscriptionData api;
  String? message;
  List<SubscriptionModel>? data;
  SubscriptionsCubit(this.api) : super(SubscriptionsInitial());

  void getSubscriptions() async {
    emit(SubscriptionsLoading());
    try {
      data = await api.getSubscriptions();
      emit(SubscriptionsSuccess(
        data: data,
      ));
    } on Exception catch (e, stackTrace) {
      emit(SubscriptionsFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');
    }
  }

   postSubscriptions({required int subscription, required String session, required String hour}) async {
    emit(SubscriptionsLoading());
    try {
      message = await api.postSubscriptions( hour: hour, session: session, subscription: subscription);
      emit(PostSubscriptionsSuccess(
        message: message,
      ));
      return true;
    } on Exception catch (e, stackTrace) {
      emit(SubscriptionsFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');
      return false;
    }
  }
}
