import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/features/auth/data/models/user_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<UserModels> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<UserModels> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModels?> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

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

      final userJson = response.user!.toJson();
      print('User JSON: $userJson'); // Debugging line

      return UserModels.fromJson(userJson);
    } catch (e) {
      print('Error during sign up: $e'); // Debugging line
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModels> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );

      if (response.user == null) {
        throw ServerException('Invalid Credentials!');
      }

      final userJson = response.user!.toJson();
      print('User JSON: $userJson'); // Debugging line

      return UserModels.fromJson(userJson);
    } catch (e) {
      print('Error during sign in: $e'); // Debugging line
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModels?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final user = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id);

        return UserModels.fromJson(user.first);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
    return null;
  }
}
