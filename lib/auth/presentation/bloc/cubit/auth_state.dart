part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  bool isloading = true;
}

class AuthSuccess extends AuthState {
  bool isloading = false;
  final String authResults;

  AuthSuccess({required this.authResults});
}

class AuthError extends AuthState {
  bool isloading = false;
  final String authResults;
  AuthError({required this.authResults});
}
class SigninLoading extends AuthState {
  bool isloading = true;
}

class SigninSuccess extends AuthState {
  bool isloading = false;
  final String authResults;

  SigninSuccess({required this.authResults});
}

class SigninError extends AuthState {
  bool isloading = false;
  final String authResults;
  SigninError({required this.authResults});
}

class VerifySuccess extends AuthState {}

class VerifyFailed extends AuthState {}