import 'package:chat_app/presentaion/screen/sign/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants/functions.dart';
import '../../../helper/firebase_auth.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textfeild.dart';

class SignIn extends StatelessWidget {
   SignIn({Key? key}) : super(key: key);
   String? mail;
   String? password;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
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
                      label: "EMail",

                      prefix: Icons.mail,
                      type: TextInputType.emailAddress,
                      suffix: Icon(Icons.arrow_forward_ios_rounded),
                      isPassword: false,
                      onChange: (value) {
                        mail = value;
                      }),
                  SizedBox(
                    height: height * .02,
                  ),
                  defaultFormField(
                      label: "Password",
                      prefix: Icons.lock,
                      type: TextInputType.visiblePassword,
                      suffix: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      isPassword: true,
                      onChange: (value) {  password = value;}),
                  SizedBox(
                    height: height * .02,
                  ),
                  Center(
                    child: defaultButton(
                        text: "Login",
                        function: () async {
                          // var auth = FirebaseAuth.instance;
                          // UserCredential credential = await
                          // auth.signInWithEmailAndPassword(email: mail!, password: password!);

                          firebaseLogin(mail: mail!,password: password!);

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
                        navigateAndFinish(context, widget: SignUp());
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
                            style: TextStyle(fontSize: 14, color: Colors.black),
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
    );
  }
}
