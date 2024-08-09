
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any non-numeric characters except for the slash
    newText = newText.replaceAll(RegExp(r'[^0-9/]'), '');

    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    // Add the slash after the first two digits if it's not already there
    if (newText.length >= 2 && !newText.contains('/')) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }

    // Validate if the date is a valid upcoming date
    if (newText.length == 5) {
      final month = int.tryParse(newText.substring(0, 2));
      final year = int.tryParse(newText.substring(3));

      final currentDate = DateTime.now();
      final currentYear = currentDate.year % 100; // Get the last two digits of the current year
      final currentMonth = currentDate.month;

      if (month == null || year == null || month < 1 || month > 12 || (year < currentYear) || (year == currentYear && month < currentMonth)) {
        return oldValue;
      }
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
