import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trials/features/registration/data/data_source/register_data_source.dart';
import 'package:trials/features/registration/presentation/controller/Auth_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterDataSource api;
  String? message;
  RegisterCubit(this.api) : super(RegisterInitial());

  void pay(
      {int? age,
      required String firstName,
      required String secondName,
      String? gender,
      String? nationality,
      required String whatsapp,
      String? difficulties,
      required String email,
      String? description,
      String? subject}) async {
    emit(RegisterLoading());
    try {


      message = await api.register(
          age: age,
          firstName: firstName,
          secondName: secondName,
          gender: gender,
          nationality: nationality,
          whatsapp: whatsapp,
          difficulties: difficulties,
          email: email,
          description: description,
          subject: subject);
      emit(RegisterSuccess(
        message: message,
      ));
      debugPrint('nlkesfnefn$message');
    } on Exception catch (e, stackTrace) {
      emit(RegisterFailure(errMessage: 'error: $e'));
      debugPrint('$e');
      debugPrint('$stackTrace');
    }
  }
}
