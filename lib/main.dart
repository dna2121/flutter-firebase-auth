import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/app_pages.dart';
import 'package:flutter_firebase_authentication/auth/controller/auth_controller.dart';
import 'package:flutter_firebase_authentication/auth/views/signin_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCa3c9Vsq2ECW4fWbXXFAKmOzkJJxWaAPI",
        appId: "1:1073308277702:ios:1b9501f81c270564b1f0c7",
        messagingSenderId: "1073308277702",
        projectId: "auth-d10c6"),
  ).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          background: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'NotoSansJP',
      ),
      home: const SigninPage(),
      getPages: AppPages.routes,
      initialRoute: '/signin',
    );
  }
}
