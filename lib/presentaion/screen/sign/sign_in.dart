import 'package:chat_app/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../constants/functions.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textfeild.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? mail;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Container(
            height: height,
            width: width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome,\nSign In",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'demi'),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/chat.gif",
                          height: height * .4,
                          width: width * .8,
                        ),
                      ),
                      defaultFormField(
                        context,
                        label: "Email",
                        prefix: Icons.mail,
                        type: TextInputType.emailAddress,
                        suffix: Icon(Icons.arrow_forward_ios_rounded),
                        isPassword: false,
                        onChange: (value) {
                          mail = value;
                        },
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      defaultFormField(
                        context,
                        label: "Password",
                        prefix: Icons.lock,
                        type: TextInputType.visiblePassword,
                        suffix: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        isPassword: true,
                        onChange: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Center(
                        child: defaultButton(
                            text: "Login",
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: mail!, password: password!);
                                  showToast(
                                      backgroundColor: Colors.black,
                                      text: "Login Successes");

                                  Navigator.pushReplacementNamed(context, home,
                                      arguments: mail);

                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    showToast(
                                        backgroundColor: Colors.black,
                                        text: "No user found for that email.");
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    showToast(
                                        backgroundColor: Colors.black,
                                        text:
                                            "Wrong password provided for that user.");
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }

                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                return null;
                              }
                            },
                            width: width,
                            background: Colors.black,
                            isUpperCase: true,
                            radius: 25),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              signUp,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Don't have account ? ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
