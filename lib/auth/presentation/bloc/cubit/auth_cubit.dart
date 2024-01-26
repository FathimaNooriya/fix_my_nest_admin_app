import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../business/entities/login_entity.dart';
import '../../../business/repositories/abstract_auth_repo.dart';
import '../../../data/datasourses/phone_no_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController loginPhoneNoController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final GlobalKey<FormState> sigupInKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginPhnoNoKey = GlobalKey<FormState>();
  String phoneVerificationId = '';
  String otpValue = "";
  final AuthRepository authrepo;
  AuthCubit(this.authrepo) : super(AuthInitial());

  Future<void> registration({signUpEmail, signUpPassword, context}) async {
    emit(AuthLoading());
    final result = await authrepo.signUp(
        loginEntity: LoginEntity(email: signUpEmail, password: signUpPassword));
    result.fold((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
      emit(AuthError(authResults: error));
    }, (admin) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${admin.user!.email} is registerd')));
      emit(AuthSuccess(authResults: admin.user!.email.toString()));
    });
  }

  Future<void> login({loginEmail, loginPassword, context}) async {
    emit(SigninLoading());
    final result = await authrepo.signIn(
        loginEntity: LoginEntity(email: loginEmail, password: loginPassword));
    result.fold((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
      emit(SigninError(authResults: error));
    }, (admin) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${admin.user!.email} is logging in ')));
      emit(SigninSuccess(authResults: admin.user!.email.toString()));
    });
  }

  Future<void> verifyPhoneNo({phoneNo, context}) async {
    emit(AuthLoading());
    phoneVerificationId = await PhoneNumberRepository.verifyPhoneNumber(
        phoneNo: phoneNo, context: context);
    phoneVerificationId == ""
        ? emit(VerifyFailed())
        : {
            emit(VerifySuccess()),
            loginPhoneNoController.clear(),
          };
  }

  Future<void> changeOtpValue({otpCode}) async {
    otpValue = otpCode;
  }

  Future<void> verifyOtp({otpCode, context, verificationId}) async {
    emit(AuthLoading());
    bool result = await PhoneNumberRepository.verifyOtp(
        verificationId: verificationId, otp: otpCode, context: context);
    result == true ? emit(VerifySuccess()) : emit(VerifyFailed());
  }
}
