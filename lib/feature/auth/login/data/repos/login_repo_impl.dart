import 'package:atw/feature/auth/login/domain/repos/login_data_source.dart';
import 'package:atw/feature/auth/login/domain/repos/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginRepoImpl implements LoginRepo{
  LoginDataSource loginDataSource;
  LoginRepoImpl({required this.loginDataSource});
  @override
  Future<UserCredential?> signIn(BuildContext context, String email, String password) async {
    var response = await loginDataSource.signIn(context, email, password);
    return response;
  }
}