import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String user = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('$user, $email, $password');
    }
  }
}
