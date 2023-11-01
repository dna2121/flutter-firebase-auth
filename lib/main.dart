import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/app_pages.dart';
import 'package:flutter_firebase_authentication/auth/views/signin_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBSyHMR5dfjwkN0zBzbJpT2Qs-jFEJSDt0",
      appId: "1:698080349481:web:298a9a7a3f24e81726bb38",
      messagingSenderId: "698080349481",
      projectId: "flutterfirebaseauth-b582e",
    ),
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        fontFamily: 'NotoSansJP',
      ),
      home: const SigninPage(),
      getPages: AppPages.routes,
      initialRoute: '/signin',
    );
  }
}
