
import 'package:flutter/cupertino.dart';

import '../models/signup_model.dart';

class SignupController {
  final formKey = GlobalKey<FormState>();
  final SignupModel user = SignupModel(
    nomPrenom: '',
    email: '',
    phoneNumber: '',
    address: '',
    city: '',
    postalCode: '',
    password: '',
    confirmPassword: '',
  );

  final List<String> cities = [
    'Tunis', 'Ariana', 'Ben Arous', 'Mannouba', 'Bizerte', 'Nabeul',
    'Béja', 'Jendouba', 'Zaghouan', 'Siliana', 'Le Kef', 'Sousse',
    'Monastir', 'Mahdia', 'Kasserine', 'Sidi Bouzid', 'Kairouan', 'Gafsa',
    'Sfax', 'Gabès', 'Médenine', 'Tozeur', 'Kebili', 'Tataouine'
  ];

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      bool success = await user.saveUser();
      if (success) {
        // Handle successful registration (e.g., navigate to another screen)
        print('User Registered: ${user.nomPrenom}, ${user.email}');
      } else {
        // Handle registration failure
        print('Registration failed');
      }
    }
  }
}
