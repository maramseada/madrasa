import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class BirthdaySelectWidget extends StatelessWidget {
  const BirthdaySelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TimePickerSpinnerPopUp(
      mode: CupertinoDatePickerMode.date,

      barrierColor: Colors.black12, //Barrier Color when pop up show
      minuteInterval: 1,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      cancelText: 'الغاء',
      confirmText: 'تأكيد',
      pressType: PressType.singlePress,
      timeFormat: 'dd/MM/yyyy',
      // Customize your time widget
      // timeWidgetBuilder: (dateTime) {},
      onChange: (dateTime) {
        debugPrint(dateTime.toString());
      },
    );
  }
}
