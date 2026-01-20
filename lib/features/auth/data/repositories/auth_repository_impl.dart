import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/network/connection_checker.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/core/common/entities/user_entity.dart';
import 'package:blog_app/features/auth/data/models/user_models.dart';
import 'package:blog_app/features/auth/domain/respository/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final ConnectionChecker _connectionChecker;
  AuthRepositoryImpl(this.authRemoteDataSource, this._connectionChecker);

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      if (!await (_connectionChecker.isConnected)) {
        final session = authRemoteDataSource.currentUserSession;

        if (session == null) {
          return Left(Failure("User not logged in!"));
        }

        return Right(
          UserModels(
            id: session.user.id,
            name: '',
            email: session.user.email ?? "",
          ),
        );
      }

      final userData = await authRemoteDataSource.getCurrentUserData();

      if (userData == null) {
        return Left(Failure("User not logged in!"));
      }

      return Right(userData);
    } on sb.AuthException catch (e) {
      return Left(
        Failure(e.message.isNotEmpty ? e.message : "An unknown error occurred"),
      );
    } on ServerException catch (e) {
      return Left(
        Failure(e.message.isNotEmpty ? e.message : "An unknown error occurred"),
      );
    }
  }

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
      if (!await (_connectionChecker.isConnected)) {
        return Left(Failure("No internet Conection!"));
      }
      final user = await fn();

      return Right(user);
    } on ServerException catch (e) {
      return Left(
        Failure(e.message.isNotEmpty ? e.message : "An unknown error occurred"),
      );
    }
  }
}
