import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants/functions.dart';
import '../presentaion/screen/chatting/home.dart';

Future<void> firebaseRegister(
    {required String emailAddress, required String password}) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    showToast(backgroundColor: Colors.black, text: "Registration Successes");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      showToast(
          backgroundColor: Colors.black,
          text: "The account already exists for that email.");
    }
  } catch (e) {
    print(e);
  }
}

Future<void> firebaseLogin(context,
    {required String mail, required String password}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: password);
    showToast(backgroundColor: Colors.black, text: "Login Successes");
    navigateAndFinish(context, widget: Home());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showToast(
          backgroundColor: Colors.black, text: "No user found for that email.");
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showToast(
          backgroundColor: Colors.black,
          text: "Wrong password provided for that user.");
      print('Wrong password provided for that user.');
    }
  }
}
