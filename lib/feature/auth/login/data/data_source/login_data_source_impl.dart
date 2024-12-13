import 'package:atw/core/network/firebase/firebase_uitiles.dart';
import 'package:atw/feature/auth/login/domain/repos/login_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginDataSourceImpl implements LoginDataSource {
  FirebaseUtils firebaseUtils;
  LoginDataSourceImpl({required this.firebaseUtils});
  @override
  Future<UserCredential?> signIn (
    BuildContext context, String email, String password) async {
    var response = await firebaseUtils.login(
      context,
      email,
      password,
    );
    return response;
  }
}
