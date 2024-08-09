import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/font_styles.dart';
import '../../../../core/constants/text.dart';

class BirthdaySelectWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const BirthdaySelectWidget({
    super.key,
    required this.onDateSelected,
  });

  @override
  State<BirthdaySelectWidget> createState() => _BirthdaySelectWidgetState();
}

class _BirthdaySelectWidgetState extends State<BirthdaySelectWidget> {
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    dateController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: dateController,
        decoration: InputDecoration(


            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color(AppColors.grayBorder),
              ),
            ),
            suffixIcon: Icon(
              Icons.calendar_month,
              color: Color(AppColors.grayText),
            ),
            hintText: AppText.birthday,
            hintStyle: AppStyles.styleBold16(
                context: context, color: Color(AppColors.grayText)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color(AppColors.grayBorder),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color(AppColors.grayBorder),
              ),
            ),
            focusColor: Colors.white),
        readOnly: true,
        onTap: () {
          selectDate();
        },
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1930),
    );
    if (picked != null) {
      widget.onDateSelected(picked); // Pass selected date to callback
      setState(() {
        dateController.text = picked.toString().split(' ')[0];
      });
    }
  }
}
