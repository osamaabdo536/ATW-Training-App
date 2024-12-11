import 'package:atw/constants.dart';
import 'package:atw/feature/auth/login/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: "Let's Sign you in", size: 35, fontWeight: FontWeight.w600),
              TextWidget(text: "Welcome back.", size: 35, fontWeight: FontWeight.w400),
              TextWidget(text: "You've been missed!", size: 35, fontWeight: FontWeight.w400),
            ],
          ),
        ),
      ),
    );
  }
}


