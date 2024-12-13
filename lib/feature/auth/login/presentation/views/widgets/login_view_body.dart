import 'package:atw/feature/auth/login/presentation/views/widgets/password_validation.dart';
import 'package:atw/feature/auth/login/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../login_cubit/login_cubit.dart';
import 'custom_elevated_button.dart';
import 'custom_text_form_filed.dart';
import 'email_validation.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final LoginCubit loginCubit = GetIt.instance<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if (state is LoginLoading) {
    } else if (state is LoginFailure) {
      Navigator.pop(context); // Close loading indicator
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error occurred')),
      );
    } else if (state is LoginSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Success')),
      );
      print('Success');
    }
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  key: loginCubit.key,
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
                        controller: loginCubit.emailController,
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
                        controller: loginCubit.passwordController,
                        validator: passwordValidation,
                        isObscure: loginCubit.isVisible,
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              loginCubit.isVisible = !loginCubit.isVisible;
                              setState(() {});
                            });
                          },
                          icon: Icon(
                            loginCubit.isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.34,
                ),
                CustomElevatedButton(
                  onPressed: ()
                  {
                    loginCubit.login(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Opacity(
                      opacity: 0.6,
                      child: TextWidget(
                        text: "Don't have an account?",
                        size: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const TextWidget(
                        text: "Register",
                        size: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
),
);
  }
}
