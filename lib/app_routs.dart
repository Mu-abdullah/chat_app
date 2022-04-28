import 'package:chat_app/presentaion/screen/chatting/home.dart';
import 'package:chat_app/presentaion/screen/sign/sign_in.dart';
import 'package:chat_app/presentaion/screen/sign/sign_up.dart';
import 'package:flutter/material.dart';

import 'constants/strings.dart';

class AppRouter {
  Route? generateRouts(RouteSettings settings) {
    switch (settings.name) {
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUp());

      case signIn:
        return MaterialPageRoute(builder: (_) => SignIn());

      case home:
        final mail = settings.arguments;
        return MaterialPageRoute(builder: (_) => Home(senderID: mail),);
    }
  }
}
