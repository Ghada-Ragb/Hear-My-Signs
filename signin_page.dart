import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test_grad/helper/showsnackbar.dart';
import 'package:test_grad/screens/login_page.dart';
import 'package:test_grad/widget/widget_textfield.dart';

class Sign_In extends StatefulWidget {
  Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  GlobalKey<FormState> formkey = GlobalKey();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height / .8,
          width: MediaQuery.of(context).size.width / .8,
          child: Center(
            child: Form(
              key: formkey,
              child: ListView(children: [
                const SizedBox(
                  height: 5,
                ),
                const CircleAvatar(
                  radius: 115,
                  backgroundImage: AssetImage('assets/images/register.jpeg'),
                ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color(0xFF649292),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                MyTextField(
                  controller: usernameController,
                  hintText: ' User Name',
                  obscureText: false,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Passward',
                  obscureText: true,
                  icon: Icons.key,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 110, vertical: 8),
                  child: ButtonReuse(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await signUpUser();

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: ((context) {
                              return LogIn();
                            })));
                            showSimpleAlertDialog(context, "success");
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'weak-password') {
                              showSimpleAlertDialog(context, "weak password");
                            } else if (ex.code == "email-already-in-use") {
                              showSimpleAlertDialog(
                                  context, "email already exists");
                            }
                          }
                          isloading = false;
                          setState(() {});
                        } else {}
                      },
                      text: 'Sign Up'),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member? ',
                        style: TextStyle(
                            color: Color(0xFF959595),
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogIn(),
                            ),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              color: Color(0xFF649292),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String username = usernameController.text;

    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Set the display name
    await userCredential.user!.updateProfile(displayName: username);
  }
}
