import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseUtils {
  FirebaseUtils._();

  /// private
  static FirebaseUtils? _instance;

  static FirebaseUtils getInstance() {
    _instance ??= FirebaseUtils._();
    return _instance!;
  }

  static final auth = FirebaseAuth.instance;


  Future<UserCredential?> login(
      BuildContext context,
      String email,
      String password,
      ) async {
    try {
      // Try to sign in the user
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('User signed in successfully');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMsg(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showMsg(context, 'Wrong password provided for that user.');
      } else {
        showMsg(context, e.message ?? 'Unknown error occurred.');
      }
    } catch (e) {
      showMsg(context, 'An error occurred: ${e.toString()}');
    }

    return null; // Return null in case of an error
  }

  static showMsg(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}