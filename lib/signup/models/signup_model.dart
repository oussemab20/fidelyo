class SignupModel {
  String nomPrenom;
  String email;
  String phoneNumber;
  String address;
  String city;
  String postalCode; // New field
  String password;
  String confirmPassword;

  SignupModel({
    required this.nomPrenom,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.postalCode, // Initialize the new field
    required this.password,
    required this.confirmPassword,
  });

  // Mocking a database save method
  Future<bool> saveUser() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call
    return true; // Assume the user is saved successfully
  }
}
