import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/respository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async => _getUser(
    () => authRemoteDataSource.signInWithEmailPassword(
      email: email,
      password: password,
    ),
  );

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async => _getUser(
    () => authRemoteDataSource.signUpWithEmailPassword(
      email: email,
      password: password,
      name: name,
    ),
  );

  Future<Either<Failure, UserEntity>> _getUser(
    Future<UserEntity> Function() fn,
  ) async {
    try {
      final user = await fn();

      return Right(user);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message.isNotEmpty ? e.message : "An unknown error occurred"),
      );
    }
  }
}
