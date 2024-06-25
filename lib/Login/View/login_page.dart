
import 'package:flutter/material.dart';
import '../Controller/login_controller.dart';
import '../Model/login_model.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginModel _model = LoginModel();
  late LoginController _controller;

  bool _forgotPasswordClicked = false;
  bool _registerClicked = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = LoginController(_model);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF047857), width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF047857), width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF047857), width: 1.0),
          ),
        ),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'FIDELYO',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF047857),
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Numéro de téléphone',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Numéro de téléphone',
                  ),
                  onChanged: _controller.updatePhoneNumber,
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Mot de passe',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'Mot de passe',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF047857),
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  onChanged: _controller.updatePassword,
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _forgotPasswordClicked = true;
                    });
                    _controller.forgotPassword();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: _forgotPasswordClicked ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: _model.rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _controller.toggleRememberMe(value);
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Color(0xFF047857); // Selected color (green)
                        }
                        return Colors.white; // Unselected color
                      }),
                    ),
                    Text('Se souvenir de moi'),
                  ],
                ),
                SizedBox(height: 70),
                ElevatedButton(
                  onPressed: _controller.login,
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
                    'Connecter',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _registerClicked = true;
                      });
                      _controller.register();
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Nouveau client ? ',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'S\'inscrire ici',
                            style: TextStyle(
                              fontSize: 17,
                              color: _registerClicked ? Colors.grey : Color(0xFF047857),
                              decoration: _registerClicked ? TextDecoration.none : TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
