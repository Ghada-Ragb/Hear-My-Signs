import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_grad/helper/showsnackbar.dart';
import 'package:test_grad/screens/forgettenpassword/fpage.dart';
import 'package:test_grad/screens/login_page.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Text(
              'Change Password',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color(0xFF6FA1A2),
        centerTitle: true,
      ),
      body: Center(
        child: ChangePasswordForm(),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  ChangePasswordFormState createState() {
    return ChangePasswordFormState();
  }
}

class ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60.0),
              TextFormField(
                controller: _currentPasswordController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  hoverColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6FA1A2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6FA1A2)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _currentPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFF6FA1A2),
                    ),
                    onPressed: () {
                      setState(() {
                        _currentPasswordVisible = !_currentPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
                obscureText: !_currentPasswordVisible,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6FA1A2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6FA1A2)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _newPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFF6FA1A2),
                    ),
                    onPressed: () {
                      setState(() {
                        _newPasswordVisible = !_newPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  return null;
                },
                obscureText: !_newPasswordVisible,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Re-type New Password',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6FA1A2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6FA1A2)),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFF6FA1A2),
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please re-type your new password';
                  }
                  return null;
                },
                obscureText: !_confirmPasswordVisible,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await changePassword();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                      showSimpleAlertDialog(
                          context, 'Password changed successfully');
                    } catch (e) {
                      // Handle password change errors
                      showSimpleAlertDialog(context, 'Error: $e');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(190, 45),
                  //primary: Color(0xFF6FA1A2),
                  backgroundColor: Color(0xFF6FA1A2), // Set the desired color
                ),
                child: Text('Change Password',
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgottenPassword()),
                  );
                },
                child: Text(
                  'Forgotten Password?',
                  style: TextStyle(
                      color: Color(0xFF6FA1A2),
                      fontSize: 15 // Set the desired text color
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> changePassword() async {
    String currentPassword = _currentPasswordController.text.trim();
    String newPassword = _newPasswordController.text.trim();

    User? user = FirebaseAuth.instance.currentUser;

    AuthCredential credential = EmailAuthProvider.credential(
      email: user!.email!,
      password: currentPassword,
    );
    await user.reauthenticateWithCredential(credential);

    // Change the user's password
    await user.updatePassword(newPassword);
  }
}
