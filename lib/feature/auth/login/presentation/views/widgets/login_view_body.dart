import 'package:atw/feature/auth/login/presentation/views/widgets/password_validation.dart';
import 'package:atw/feature/auth/login/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'custom_text_form_filed.dart';
import 'email_validation.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                  text: "Let's Sign you in",
                  size: 38,
                  fontWeight: FontWeight.w600),
              const TextWidget(
                  text: "Welcome back.", size: 38, fontWeight: FontWeight.w400),
              const TextWidget(
                  text: "You've been missed!",
                  size: 38,
                  fontWeight: FontWeight.w400),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: "Email",
                      size: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomTextFormFiled(
                      hintText: "Your email",
                      validator: emailValidation,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const TextWidget(
                      text: "Password",
                      size: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomTextFormFiled(
                      hintText: "Password",
                      controller: passwordController,
                      validator: passwordValidation,
                      isObscure: isVisible,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                            setState(() {});
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
