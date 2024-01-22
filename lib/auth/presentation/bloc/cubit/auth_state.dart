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
