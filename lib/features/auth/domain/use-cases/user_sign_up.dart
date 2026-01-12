import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/respository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<UserEntity, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
