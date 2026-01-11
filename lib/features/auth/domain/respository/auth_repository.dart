import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
