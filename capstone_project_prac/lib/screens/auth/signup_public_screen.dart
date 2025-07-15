import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/logo_widget.dart';

class SignUpPublicScreen extends StatefulWidget {
  const SignUpPublicScreen({Key? key}) : super(key: key);

  @override
  State<SignUpPublicScreen> createState() => _SignUpPublicScreenState();
}

class _SignUpPublicScreenState extends State<SignUpPublicScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  String error = '';

  void _signUp() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        birthdayController.text.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        error = 'Please fill all fields';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [gradientStart, gradientEnd],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(width: 240, height: 240),
                const SizedBox(height: 40),
                Text(
                  'PUBLIC USER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'REGISTRATION',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: mobileController,
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: birthdayController,
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                if (error.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(error, style: TextStyle(color: Colors.red)),
                ],
                const SizedBox(height: 32),
                GradientButton(
                  text: 'Sign Up',
                  onPressed: _signUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 