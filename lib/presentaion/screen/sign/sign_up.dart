import 'package:chat_app/presentaion/screen/sign/sign_in.dart';
import 'package:flutter/material.dart';
import '../../../constants/functions.dart';
import '../../widgets/buttons.dart';
import '../../widgets/textfeild.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var mail = TextEditingController();
    var name = TextEditingController();
    var phone = TextEditingController();
    var password = TextEditingController();
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
                    "Welcome,\nSign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'demi'),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/register.gif",
                      height: height * .4,
                      width: width * .8,
                    ),
                  ),
                  defaultFormField(
                      label: "Name",
                      controller: name,
                      prefix: Icons.person,
                      type: TextInputType.name,
                      validate: (value) {},
                      suffix: Icon(Icons.arrow_forward_ios_rounded),
                      isPassword: false,
                      onChange: (value) {}),
                  SizedBox(
                    height: height * .02,
                  ),
                  defaultFormField(
                      label: "EMail",
                      controller: mail,
                      prefix: Icons.mail,
                      type: TextInputType.emailAddress,
                      validate: (value) {},
                      suffix: Icon(Icons.arrow_forward_ios_rounded),
                      isPassword: false,
                      onChange: (value) {}),
                  SizedBox(
                    height: height * .02,
                  ),
                  defaultFormField(
                      label: "Phone",
                      controller: phone,
                      prefix: Icons.phone,
                      type: TextInputType.phone,
                      validate: (value) {},
                      suffix: Icon(Icons.arrow_forward_ios_rounded),
                      isPassword: false,
                      onChange: (value) {}),
                  SizedBox(
                    height: height * .02,
                  ),
                  defaultFormField(
                      label: "Password",
                      controller: password,
                      prefix: Icons.lock,
                      type: TextInputType.visiblePassword,
                      validate: (value) {},
                      suffix: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                      isPassword: true,
                      onChange: (value) {}),
                  SizedBox(
                    height: height * .02,
                  ),
                  Center(
                    child: defaultButton(
                        text: "Sign Up",
                        function: () {},
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
                        navigateAndFinish(context, widget: SignIn());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Have account ? ",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Sign In",
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
