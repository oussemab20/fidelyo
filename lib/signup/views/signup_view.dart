import 'package:flutter/material.dart';
import '../controllers/signup_controller.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final SignupController _controller = SignupController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Nom et Prénom',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                buildTextFormField(
                  'Nom et Prénom',
                  'Please enter your name',
                      (value) => _controller.user.nomPrenom = value!,
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Adresse E-mail',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                buildTextFormField(
                  'Adresse E-mail',
                  'Please enter an email',
                      (value) => _controller.user.email = value!,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Numéro de téléphone',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                buildTextFormField(
                  'Numéro de téléphone',
                  'Please enter your phone number',
                      (value) => _controller.user.phoneNumber = value!,
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Adresse',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                buildTextFormField(
                  'Adresse',
                  'Please enter your address',
                      (value) => _controller.user.address = value!,
                ),
                SizedBox(height: 18),
                Text(
                  'Ville et Code Postal',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Ville',
                            labelStyle: TextStyle(color: Colors.grey),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF047857), width: 1.0), // Green border, width 1.0
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF047857), width: 1.0), // Green border, width 1.0
                            ),
                          ),
                          items: _controller.cities.map((String city) {
                            return DropdownMenuItem<String>(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _controller.user.city = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a city';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    Expanded(
                      child: Container(
                        height: 55,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Code Postal',
                            labelStyle: TextStyle(color: Colors.grey),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF047857), width: 1.0), // Green border, width 1.0
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF047857), width: 1.0), // Green border, width 1.0
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your postal code';
                            }
                            return null;
                          },
                          onSaved: (value) => _controller.user.postalCode = value!,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Mot de Passe',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                buildTextFormField(
                  'Mot de Passe',
                  'Please enter a password',
                      (value) => _controller.user.password = value!,
                  obscureText: !_passwordVisible,
                  showPassword: _passwordVisible,
                  togglePasswordVisibility: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Confirmation mot de passe',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                buildTextFormField(
                  'Confirmation mot de passe',
                  'Please confirm your password',
                      (value) => _controller.user.confirmPassword = value!,
                  obscureText: !_confirmPasswordVisible,
                  showPassword: _confirmPasswordVisible,
                  togglePasswordVisibility: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _controller.user.password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_controller.formKey.currentState!.validate()) {
                      _controller.formKey.currentState!.save();
                      bool success = await _controller.user.saveUser();
                      if (success) {
                        // Handle successful registration (e.g., navigate to another screen)
                        print('User Registered: ${_controller.user.nomPrenom}, ${_controller.user.email}');
                      } else {
                        // Handle registration failure
                        print('Registration failed');
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF047857)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 16.0)),
                    minimumSize: MaterialStateProperty.all<Size>(Size(380.0, 0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String labelText,
      String errorMessage,
      FormFieldSetter<String> onSaved, {
        bool obscureText = false,
        FormFieldValidator<String>? validator,
        bool showPassword = false,
        VoidCallback? togglePasswordVisibility,
      }) {
    return Container(
      width: 380,
      height: 55,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF047857), width: 1.0), // Green border, width 1.0
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF047857), width: 1.0), // Green border, width 1.0
          ),
          suffixIcon: obscureText
              ? IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: togglePasswordVisibility,
          )
              : null,
        ),
        obscureText: obscureText && !showPassword,
        validator: validator ??
                (value) {
              if (value == null || value.isEmpty) {
                return errorMessage;
              }
              return null;
            },
        onSaved: onSaved,
      ),
    );
  }
}
