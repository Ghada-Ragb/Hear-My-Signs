import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_grad/helper/showsnackbar.dart';
import 'package:test_grad/screens/login_page.dart';
import 'package:test_grad/widget/widget_textfield.dart';

class ForgottenPassword extends StatefulWidget {
  ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwardReset() async {
    try {
      // Check if the email exists
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(
        emailController.text.trim(),
      );

      // If the email doesn't exist, show an error
      if (signInMethods.isEmpty) {
        showSimpleAlertDialog(
            context, "password send to your email! check your email .");
      } else {
        // Email exists, proceed with sending password reset email
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );

        // Show success message
        showSimpleAlertDialog(
            context, "Password reset email sent! Check your email.");

        // Navigate to login screen
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return LogIn();
        })));
      }
    } on FirebaseAuthException catch (ex) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(ex.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF3F4F9),
        appBar: AppBar(
          title: Column(
            children: [
              Icon(Icons.person),
              Text('Forgetten Password'),
            ],
          ),
          backgroundColor: Color(0xFF6FA1A2),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            height: 400,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Enter the email address associate with you account ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF959595),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: Icons.email,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonReuse(text: 'Send', onTap: passwardReset),
              ],
            ),
          ),
        ));
  }
}
