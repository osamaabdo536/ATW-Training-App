import 'package:atw/feature/auth/login/domain/repos/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;
  final LoginRepo loginRepo = GetIt.instance<LoginRepo>();
  var key = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    if (key.currentState?.validate() == true) {
      emit(LoginLoading());

      try {
        // Perform the sign-in logic here
        var result = await loginRepo.signIn(
          context,
          emailController.text,
          passwordController.text,
        );

        if (result?.user != null) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure( errMessage: 'Sign in failed',));
        }
      } catch (e) {
        emit(LoginFailure(errMessage: "An error occurred during sign in"));
      }
    }
  }
}
