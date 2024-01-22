import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../business/entities/login_model.dart';

class LoginRepository {
  static Future<String> login({
    required LoginModel loginModel,
    required context,
  }) async {
    debugPrint("1");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginModel.email, password: loginModel.password);
      debugPrint("2");

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are Logged in')));
      return 'You are Logged in';
    } on FirebaseAuthException catch (e) {
      debugPrint("4");
      debugPrint(e.code);
      if (e.code == 'user-not-found') {
        debugPrint("5");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        debugPrint("6");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password did not match')));
      }
      return "Error found";
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return e.toString();
    }
  }
}
