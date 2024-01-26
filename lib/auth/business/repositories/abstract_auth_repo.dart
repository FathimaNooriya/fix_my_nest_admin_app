import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserCredential>> signIn({required LoginEntity loginEntity});
  Future<Either<String, UserCredential>> signUp({required LoginEntity loginEntity});
}
