
import 'package:flutter/material.dart';

import '../../boutique_page/view/boutique_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPageScreen(),
    );
  }
}

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.network(
              'https://images.hdqwalls.com/download/bitcoin-network-4k-89-1080x1920.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Title "Fidelyo"
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto', // Example of custom font
                        ),
                        children: [
                          TextSpan(
                            text: 'FIDELY',
                          ),
                          TextSpan(
                            text: 'O',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Text "Un coin qui représente les points"
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 5.0), // Adding extra spacing
                        Text(
                          'UN COIN',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat', // Example of custom font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'QUI REPRESENTE',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat', // Example of custom font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'LES POINTS',
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                            fontFamily: 'Montserrat', // Example of custom font
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Continue button
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          margin:
                          EdgeInsets.only(left: 15, right: 15, bottom: 10),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontFamily:
                                  'Roboto', // Example of custom font
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                    'En vous connectant ou en vous enregistrant, vous acceptez ',
                                  ),
                                  TextSpan(
                                    text:
                                    'les conditions générales et la politique de confidentialité.',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BoutiqueScreen()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF047857)),
                          padding:
                          MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(
                                  vertical: 12.0)), // Adjusted padding
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(350.0, 0)), // Smaller width
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(),
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              4.0), // Box shadow
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.black.withOpacity(0.5)), // Shadow color
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}