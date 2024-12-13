import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginRepo {
  Future<UserCredential?> signIn(
    BuildContext context,
    String email,
    String password,
  );
}
