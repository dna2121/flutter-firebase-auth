// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  //username, password, name
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);

    //user will be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/signin');
    } else {
      Get.offAllNamed('/welcomepage');
    }
  }

  void signUp(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == "weak-password") {
          Get.snackbar(
              "Weak password", "Password should be at least 6 characters",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade400);
        } else if (e.code == 'invalid-email') {
          Get.snackbar(
            "Invalid email",
            "The email address is badly formatted.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade400,
          );
          return;
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            "Email already in use",
            "The email address is already in use by another account.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade400,
          );
          return;
        } else {
          Get.snackbar("Failed to create account", "Something is wrong",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade400);
        }
      }

      print(e.toString());
    }
  }

  void signIn(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'wrong-password') {
          Get.snackbar(
            "Wrong password",
            "The provided password does not match the registered password.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade400,
          );
          return;
        } else {
          Get.snackbar("Failed to log in",
              "Something is wrong, please check and try again",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade400);
        }
      }

      print(e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
