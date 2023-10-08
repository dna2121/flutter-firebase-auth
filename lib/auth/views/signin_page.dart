import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isPasswordHidden = true.obs;

    // ignore: unused_element
    void toggleVisibility() {
      isPasswordHidden.toggle().value;
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  const Text("Welcome!"),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      obscureText: isPasswordHidden.value,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              isPasswordHidden.value = !isPasswordHidden.value;
                            },
                            icon: Icon(isPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      hoverColor: Colors.transparent,
                      child: const Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      minimumSize: Size(MediaQuery.of(context).size.width * 1,
                          MediaQuery.of(context).size.height * 0.07),
                    ),
                    onPressed: () {},
                    child: const Text("Sign in"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width * 1,
                            MediaQuery.of(context).size.height * 0.07),
                      ),
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/images/google.png',
                        height: 20,
                      ),
                      label: const Text("Sign in With Google")),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(width: 20),
                      Text("Or"),
                      SizedBox(width: 20),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up here.",
                      style: TextStyle(fontSize: 12, color: Colors.teal),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}