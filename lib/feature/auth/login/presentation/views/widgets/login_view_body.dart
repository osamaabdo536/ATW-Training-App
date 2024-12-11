import 'package:atw/feature/auth/login/presentation/views/widgets/lower_section.dart';
import 'package:atw/feature/auth/login/presentation/views/widgets/text_widget.dart';
import 'package:atw/feature/auth/login/presentation/views/widgets/upper_section.dart';
import 'package:flutter/material.dart';
import 'custom_elevated_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UpperSection(),
              LowerSection(),
            ],
          ),
        ),
      ),
    );
  }
}
