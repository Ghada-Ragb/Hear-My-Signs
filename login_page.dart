import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:test_grad/helper/showsnackbar.dart';
import 'package:test_grad/screens/basic_page.dart';
import 'package:test_grad/screens/forgettenpassword/fpage.dart';
import 'package:test_grad/screens/signin_page.dart';
import 'package:test_grad/widget/widget_textfield.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool isloading = false;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        //body:Icon(Icons.handshake_outlined),
        body: Container(
          height: MediaQuery.of(context).size.height / .1,
          width: MediaQuery.of(context).size.width / .5,
          child: Center(
            child: Form(
              key: formkey,
              child: ListView(children: [
                const CircleAvatar(
                  radius: 125,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'assets/images/WhatsApp Image 2023-11-30 at 2.48.55 PM.jpeg',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome!!',
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
                  hintText: 'Password',
                  obscureText: true,
                  icon: Icons.key,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 130),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ForgottenPassword();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'Forgotten Password ?',
                        style: TextStyle(
                            color: Color(0xFF649292),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
                            await logInUser();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: ((context) {
                                  return BasicPage();
                                }),
                              ),
                            );
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'user-not-found') {
                              showSimpleAlertDialog(context, "User not found");
                            } else if (ex.code == "wrong-password") {
                              showSimpleAlertDialog(context, "Wrong password");
                            } else {
                              showSimpleAlertDialog(
                                  context, "There was an unexpected error");
                                  // ${ex.toString()}");
                            }
                          } catch (ex) {
                            showSimpleAlertDialog(
                                context, 'There was an unexpected error');
                          } finally {
                            isloading = false;
                            setState(() {});
                          }
                        }
                      },
                      text: 'Log in'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have account ? ',
                            style: TextStyle(
                                color: Color(0xFF959595),
                                fontWeight: FontWeight.w600)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: ((context) {
                                  return Sign_In();
                                }),
                              ),
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                color: Color(0xFF649292),
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logInUser() async {
    String email = emailController.text;
    String password = passwordController.text;
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
