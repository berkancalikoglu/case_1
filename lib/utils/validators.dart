import 'package:flutter/material.dart';

class Validators {
  static final RegExp _phoneRegExp = RegExp(r'^\+90[0-9]{10}$');

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'Lütfen telefon numaranızı girin';
    } else if (!value.startsWith('+90')) {
      return 'Lütfen +90 ile başlayan bir telefon numarası yazın';
    } else if (value.length != 13) {
      return 'Lütfen telefon numaranızı doğru yazdığınızdan emin olun';
    } else if (!_phoneRegExp.hasMatch(value)) {
      return 'Geçerli bir telefon numarası girin';
    }
    return null;
  }
}
