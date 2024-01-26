
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../business/entities/login_entity.dart';

// class SignUpRepo {
//   static Future<String> signUpFn(
//       {required LoginModel signUp, required context}) async {
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: signUp.email,
//         password: signUp.password,
//       );
//       await FirebaseAuth.instance.currentUser!.updateDisplayName("Admin");
//       await FirebaseAuth.instance.currentUser!.updateEmail(signUp.email);
//       final result = await addAdmin(
//         email: signUp.email,
//         uid: userCredential.user!.uid,
//         password: signUp.password,
//       );

//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('SignUp Successful')));
//       debugPrint(result);
//       debugPrint('..........................');
//       return 'SignUp Successful';
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Password Provided is too weak')));
//         return 'Password Provided is too weak';
//       } else if (e.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Email Provided already Exists')));
//         return 'Email Provided already Exists';
//       }
//     } catch (e) {
//       debugPrint('..........................');
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//       return e.toString();
//     }
//     return "Something went wrong";
//   }
// }

// addAdmin({
//   required String email,
//   required String uid,
//   required String password,
// }) async {
//   await FirebaseFirestore.instance
//       .collection("Admin")
//       .doc(FirebaseAuth.instance.currentUser?.uid)
//       .collection("Profile")
//       .add(LoginModel(email: email, password: password).toMap());
// }
