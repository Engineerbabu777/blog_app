import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/features/auth/data/models/user_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModels> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<UserModels> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<UserModels> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );

      if (response.user == null) {
        throw ServerException('User is null!');
      }

      return UserModels.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModels> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }
}
