
import 'package:flutter/cupertino.dart';

@immutable

abstract class PaymentState {}
class PaymentInitial extends PaymentState{}
class PaymentLoading extends PaymentState{}
class PaymentSuccess extends PaymentState{

  final String?  message;
  PaymentSuccess({ required this.message});
}


class PaymentFailure extends PaymentState{

  final  String errMessage;
  PaymentFailure({required this.errMessage});
}