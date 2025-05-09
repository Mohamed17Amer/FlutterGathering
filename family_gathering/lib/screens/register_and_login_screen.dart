import 'package:family_gathering/views/login_view.dart';
import 'package:family_gathering/views/register_view.dart';
import 'package:flutter/material.dart';

class RegisterAndLoginScreen extends StatefulWidget {
  const RegisterAndLoginScreen({super.key});

  @override
  State<RegisterAndLoginScreen> createState() => _RegisterAndLoginScreenState();
}

class _RegisterAndLoginScreenState extends State<RegisterAndLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RegisterView(),
              LoginView(),
            ],
          ),
        ),
      ),
    );
  }
}
