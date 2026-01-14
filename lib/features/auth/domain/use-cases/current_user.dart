import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/respository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser implements UseCase<UserEntity?, NoParams> {
  final AuthRepository authRepository;

  CurrentUser({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await authRepository.getCurrentUser();
  }
}

class NoParams {}
