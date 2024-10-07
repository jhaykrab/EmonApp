import 'dart:async';
import 'package:Emon/screens/dashboard_screen.dart';
import 'package:Emon/screens/signup_screen.dart';
import 'package:Emon/screens/recovery_screen.dart'; // Import your recovery screen
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true; // To control password visibility

  // Add focus nodes for the text fields
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _accessKeyFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add the back button to the AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 72, 100, 68),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        backgroundColor: const Color(0xFFf5f5f5),
        elevation: 0, // Remove AppBar shadow
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFf5f5f5), Color(0xFFe8f5e9)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            // Remove extra padding from SingleChildScrollView
            padding: const EdgeInsets.only(bottom: 8.0), // Adjust as needed
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Let's sign you in!" Text
                  const Text(
                    "Let's sign you in!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 72, 100, 68),
                      fontFamily: 'Rubik',
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Logo
                  Image.asset(
                    'assets/staticimgs/login-concept-illustration.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                  const SizedBox(height: 8),

                  // Mobile No. Input Field with Icon
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: 275,
                      child: TextFormField(
                        focusNode: _mobileFocusNode,
                        cursorColor: const Color.fromARGB(
                            255, 54, 83, 56), // Set cursor color to green
                        decoration: InputDecoration(
                          labelText: 'Mobile No.',
                          labelStyle: TextStyle(
                            fontSize: 13,
                            // Change label color based on focus
                            color: _mobileFocusNode.hasFocus
                                ? const Color.fromARGB(255, 54, 83, 56)
                                : const Color.fromARGB(255, 6, 17, 8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green.shade800),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 54, 83, 56), // Green on focus
                              width: 2.0, // Thicker border on focus
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color.fromARGB(255, 54, 83, 56),
                            size: 20, // Adjusted icon size
                          ),
                        ),
                        keyboardType: TextInputType
                            .number, // Use numeric keyboard ONLY HERE
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Allow digits only ONLY HERE
                          LengthLimitingTextInputFormatter(
                              11), // Limit to 11 digits
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your mobile number';
                          }
                          if (value.length < 11) {
                            return 'Mobile number must be at least 11 digits';
                          }
                          if (value.length != 11) {
                            return 'Mobile number must be 11 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Reduced spacing

                  // Access Key Input Field with Icon and Show/Hide
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: 275,
                      child: TextFormField(
                        focusNode: _accessKeyFocusNode,
                        cursorColor: const Color.fromARGB(
                            255, 54, 83, 56), // Set cursor color to green
                        decoration: InputDecoration(
                          labelText: 'Access Key',
                          labelStyle: TextStyle(
                            fontSize: 13,
                            // Change label color based on focus
                            color: _accessKeyFocusNode
                                    .hasFocus // Use _accessKeyFocusNode here
                                ? const Color.fromARGB(255, 54, 83, 56)
                                : const Color.fromARGB(
                                    255, 6, 17, 8), // Smaller label text
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 54, 83, 56),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(
                                  255, 54, 83, 56), // Green on focus
                              width: 2.0, // Thicker border on focus
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Color.fromARGB(255, 54, 83, 56),
                            size: 20, // Adjusted icon size
                          ),
                          suffixIcon: IconButton(
                            // Show/hide password button
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: const Color.fromARGB(255, 54, 83, 56),
                            iconSize: 20, // Adjusted icon size
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        obscureText:
                            _obscureText, // Initially hide the Access Key
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a new access key';
                          }
                          if (value.length < 8) {
                            return 'Access key must be at least 8 characters';
                          }
                          if (!RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                            return 'Access key must have at least:\n- one uppercase, one lowercase, \n- one number, and one special character. \n- Minimum 8 characters. \n (e.g: J@kecasundo15)'; // Return a String error message
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 130.0), // Align from right
                    child: Align(
                      alignment:
                          Alignment.centerRight, // Align text to the right
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RecoveryScreen()),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: "Forgot Access Key? ",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 72, 100, 68),
                                fontFamily: 'Varela_Round',
                                decoration: TextDecoration.none,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Recover here',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Sign In Button
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 54, 83, 56),
                      padding: const EdgeInsets.symmetric(
                          vertical: 17, horizontal: 115),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xFFe8f5e9),
                      ),
                    ),
                  ),
                  // Sign Up Button with Shadow
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 76),
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Valera_Round',
                        ),
                        foregroundColor: const Color.fromARGB(255, 54, 83, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 54, 83, 56),
                              width: 1.0), // Add border
                        ),
                      ),
                      child: const Text('Create an Account'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }
}
