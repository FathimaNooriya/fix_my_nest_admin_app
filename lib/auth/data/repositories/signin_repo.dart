import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../business/entities/login_entity.dart';
import '../../business/repositories/abstract_auth_repo.dart';
import '../model/login_model.dart';

class AuthRepo implements AuthRepository {
  @override
  Future<Either<String, UserCredential>> signIn(
      {required LoginEntity loginEntity}) async {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: loginEntity.email, password: loginEntity.password);
      debugPrint("2");
      debugPrint(result.user!.uid);
      final admin = FirebaseFirestore.instance
          .collection("Admin")
          .doc(result.user!.uid)
          .collection("Profile");

      final snapshort = await admin.snapshots().first;
      var mydata = snapshort.docs.first;
      // mydata.data().forEach((key, value) {
      //   print(key);
      //   print(value);
      // });
      final myuser = LoginModel.fromjson(mydata.data());
      if (myuser.role == "Admin") {
        return right(result);
      } else {
        return left("${result.user!.email} is not a Admin");
      }

      // final admin = FirebaseFirestore.instance
      //     .collection("Admin")
      //     .doc(result.user!.uid)
      //     .collection("Profile")
      //     .doc('cDv80A0nROql9Md1FMie');
      // print(admin.toString());
      // final snapshort = await admin.get();
      // print(snapshort.toString());
      // snapshort.data()!.forEach((key, value) {
      //   print(key);
      //   print(value);
      // });
      // final myuser = LoginModel.fromjson(snapshort.data()!);
      // print(myuser.toString());
      // if (myuser.role == "Admin") {
      //   print("............has data........");
      // }
    } on FirebaseAuthException catch (e) {
      debugPrint("4");
      debugPrint(e.code);
      if (e.code == 'user-not-found') {
        debugPrint("5");
        const SnackBar(content: Text('No user Found with this Email'));
      } else if (e.code == 'wrong-password') {
        debugPrint("6");
      }
      return const Left("Error found");
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserCredential>> signUp(
      {required LoginEntity loginEntity}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: loginEntity.email,
        password: loginEntity.password,
      );

      await FirebaseAuth.instance.currentUser!.updateDisplayName("Admin");
      await FirebaseAuth.instance.currentUser!.updateEmail(loginEntity.email);

      await addAdmin(
        email: loginEntity.email,
        uid: userCredential.user!.uid,
        password: loginEntity.password,
      );

      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left('Password Provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        return const Left('Email Provided already Exists');
      }
    } catch (e) {
      return Left(e.toString());
    }
    return const Left("Something went wrong");
  }
}

addAdmin(
    {required String email,
    required String uid,
    required String password,
    String role = "Admin"}) async {
  await FirebaseFirestore.instance
      .collection("Admin")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("Profile")
      .add(LoginModel(email: email, password: password, role: role).toMap());
}
