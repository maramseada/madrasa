
import 'package:flutter/cupertino.dart';


class SignUpController {
  final formKey = GlobalKey<FormState>();

  String? emailErrorText;
  String? nameErrorText;
  String? secondNameErrorText;
  String? passwordErrorText;
  String? passwordErrorTextSecond;
  String? phoneErrorText;

  DateTime? selectedBirthday;
  String? selectedGender;
  String? selectedNationality;
  String? selectedDisability;
  String? additionalNotes;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordControllerSecond = TextEditingController();

  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController disabilityController = TextEditingController();
  final TextEditingController additionalNotesController = TextEditingController();
  String? name,
      phone,
      email,
      familyName,
      password,
      confirmPassword;
  void validateEmail() {
    String value = emailController.text;
    if (value.isEmpty) {
      emailErrorText = 'من فضلك أدخل بريدك الإلكتروني';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      emailErrorText = 'البريد الإلكتروني غير صحيح';
    } else {
      emailErrorText = null;
    }
  }

  void validatePhoneNumber() {
    String value = phoneController.text;
    if (value.isEmpty) {
      phoneErrorText = 'برجاء ادخال رقم التليفون';
    } else if (value.length != 11) {
      phoneErrorText = 'رقم التليفون يجب ان يكون 11 رقم';
    } else {
      phoneErrorText = null;
    }
  }

  void validateName() {
    String value = nameController.text;
    if (value.isEmpty) {
      nameErrorText = 'من فضلك أدخل إسمك';
    } else if (value.length < 2) {
      nameErrorText = 'يجب أن يتكون الاسم من حرفين على الأقل';
    } else {
      nameErrorText = null;
    }
  }

  void validateSecondName() {
    String value = secondNameController.text;
    if (value.isEmpty) {
      secondNameErrorText = 'من فضلك أدخل إسمك';
    } else if (value.length < 2) {
      secondNameErrorText = 'يجب أن يتكون الاسم من حرفين على الأقل';
    } else {
      secondNameErrorText = null;
    }
  }

  void validatePassword() {
    String value = passwordController.text;
    if (value.isEmpty) {
      passwordErrorText = 'برجاء ادخال كلمة المرور';
    } else if (value.length < 8) {
      passwordErrorText = 'كلمة المرور يجب أن يكون 8 أحرف على الأقل';
    } else {
      passwordErrorText = null;
    }
  }

  void validateSecondPassword() {
    String value = passwordControllerSecond.text;
    if (value.isEmpty) {
      passwordErrorTextSecond = 'برجاء ادخال كلمة المرور';
    } else if (value.length < 8) {
      passwordErrorTextSecond = 'كلمة المرور يجب أن يكون 8 أحرف على الأقل';
    } else if (value != passwordController.text) {
      passwordErrorTextSecond = 'كلمات المرور غير متطابقة';
    } else {
      passwordErrorTextSecond = null;
    }
  }

  void validateAllFields() {
    validateEmail();
    validatePhoneNumber();
    validateName();
    validateSecondName();
    validatePassword();
    validateSecondPassword();
    formKey.currentState?.validate();
  }

  bool isFormValid() {
    return emailErrorText == null &&
        phoneErrorText == null &&
        nameErrorText == null &&
        secondNameErrorText == null &&
        passwordErrorText == null &&
        passwordErrorTextSecond == null;
  }
}