import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/logo_widget.dart';

class SignUpVolunteerScreen extends StatefulWidget {
  const SignUpVolunteerScreen({Key? key}) : super(key: key);

  @override
  State<SignUpVolunteerScreen> createState() => _SignUpVolunteerScreenState();
}

class _SignUpVolunteerScreenState extends State<SignUpVolunteerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  String volunteerType = 'Medical';
  String validIdFile = '';
  String error = '';

  void _signUp() {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        skillsController.text.isNotEmpty &&
        validIdFile.isNotEmpty &&
        volunteerType.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        error = 'Please fill all fields';
      });
    }
  }

  void _pickValidId() {
    // Mock file picker
    setState(() {
      validIdFile = 'valid_id_sample.png';
    });
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                const LogoWidget(width: 240, height: 240),
                const SizedBox(height: 40),
                Text(
                  'VOLUNTEER',
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
                // Replace the Row for 'Upload Valid ID' with a decorated container to look like a text field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: gradientStart),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          validIdFile.isEmpty ? 'Upload Valid ID' : validIdFile,
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.upload_file, color: gradientEnd),
                        onPressed: _pickValidId,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: volunteerType,
                  decoration: InputDecoration(labelText: 'Volunteer Type'),
                  items: const [
                    DropdownMenuItem(value: 'Medical', child: Text('Medical')),
                    DropdownMenuItem(value: 'Rescue', child: Text('Rescue')),
                    DropdownMenuItem(value: 'Logistics', child: Text('Logistics')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      volunteerType = value ?? 'Medical';
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: skillsController,
                  decoration: InputDecoration(labelText: 'Skills (e.g., First Aid, Driving, Cooking)'),
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