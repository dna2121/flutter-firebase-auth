import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isPasswordHidden = true.obs;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/signin.png', height: 300),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Sign in",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "email",
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: "password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {
                          isPasswordHidden.value = !isPasswordHidden.value;
                        },
                        icon: Icon(isPasswordHidden.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Get.toNamed('/forgotpassword'),
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.signIn(
                          emailController.text.trim(),
                          passwordController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize: Size(MediaQuery.of(context).size.width * 1,
                            MediaQuery.of(context).size.height * 0.06)),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width * 1,
                            MediaQuery.of(context).size.height * 0.06)),
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.png',
                      height: 20,
                    ),
                    label: const Text("Sign in With Google")),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextSpan(
                      text: " Register here.",
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed('/signup');
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
