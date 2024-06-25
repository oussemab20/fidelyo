
import '../Model/login_model.dart';


class LoginController {
  final LoginModel model;

  LoginController(this.model);

  void updatePhoneNumber(String phoneNumber) {
    model.phoneNumber = phoneNumber;
  }

  void updatePassword(String password) {
    model.password = password;
  }

  void toggleRememberMe(bool? value) {
    model.rememberMe = value ?? false;
  }

  void login() {
    // Handle login logic
    print('Numéro de téléphone: ${model.phoneNumber}');
    print('Mot de passe: ${model.password}');
    print('Se souvenir de moi: ${model.rememberMe}');
  }

  void forgotPassword() {
    // Handle forgot password logic
    print('Mot de passe oublié tapped');
  }

  void register() {
    // Handle registration logic
    print('S\'inscrire ici tapped');
  }
}
