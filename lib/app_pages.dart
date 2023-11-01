import 'package:flutter_firebase_authentication/auth/views/forgot_password_page.dart';
import 'package:flutter_firebase_authentication/auth/views/signin_page.dart';
import 'package:flutter_firebase_authentication/auth/views/signup_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/signin',
      page: () => const SigninPage(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignupPage(),
    ),
    GetPage(
      name: '/forgotpassword',
      page: () => const ForgotPasswordPage(),
    )
  ];
}
