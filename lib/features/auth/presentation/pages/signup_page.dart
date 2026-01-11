import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up.",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),

            // MARGIN TOP / BLANK SPACE!
            const SizedBox(height: 30),

            // INPUTS!
            AuthField(hintText: "Name"),
            const SizedBox(height: 10),

            AuthField(hintText: "Email"),
            const SizedBox(height: 10),

            AuthField(hintText: "Password"),
            const SizedBox(height: 10),

            // BUTTON!
            AuthGradientButton(text: "Sign Up", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
