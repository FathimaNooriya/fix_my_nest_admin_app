import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../business/entities/login_model.dart';
import '../../../data/datasourses/login_data.dart';
import '../../../data/datasourses/signup_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController serviceAddIssueController =
      TextEditingController();
  final TextEditingController categoryAddIssueController =
      TextEditingController();
  final TextEditingController loginPhoneNoController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final GlobalKey<FormState> sigupInKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  Uint8List myImage = Uint8List.fromList([0, 1, 2, 3, 4]);
  AuthCubit() : super(AuthInitial());

  Future<void> registration({signUpEmail, signUpPassword, context}) async {
    emit(AuthLoading());
    final result = await SignUpRepo.signUpFn(
        signUp: LoginModel(email: signUpEmail, password: signUpPassword),
        context: context);
    result.contains('Registration Successful')
        ? {
            emit(AuthSuccess(authResults: result)),
          }
        : emit(AuthError(authResults: result));
  }

  Future<void> login({loginEmail, loginPassword, context}) async {
    emit(AuthLoading());

    final result = await LoginRepository.login(
        loginModel: LoginModel(
          email: loginEmail,
          password: loginPassword,
        ),
        context: context);
    result.contains('You are Logged in')
        ? {
            emit(AuthSuccess(authResults: result)),
            loginEmailController.clear(),
            loginPasswordController.clear(),
          }
        : emit(AuthError(authResults: result));
  }

}

