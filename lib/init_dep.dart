import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/env-secrets/app_secrets.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/respository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/use-cases/current_user.dart';
import 'package:blog_app/features/auth/domain/use-cases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/use-cases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/blog/data/datasources/blog_remote_datasource.dart';
import 'package:blog_app/features/blog/data/repositories/blog_repository_impl.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';
import 'package:blog_app/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:blog_app/features/blog/domain/usecases/upload_blog.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependecies() async {
  // SUPABASE!
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);

  _initAuth();
  _initBlog();

  serviceLocator.registerLazySingleton<AppUserCubit>(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        supabaseClient: serviceLocator<SupabaseClient>(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerFactory<UserSignUp>(
      () => UserSignUp(authRepository: serviceLocator()),
    )
    ..registerFactory<UserSignIn>(
      () => UserSignIn(authRepository: serviceLocator()),
    )
    ..registerFactory<CurrentUser>(
      () => CurrentUser(authRepository: serviceLocator()),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userSignIn: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}

void _initBlog() {
  serviceLocator
    ..registerFactory<BlogRemoteDatasource>(
      () => BlogRemoteDatasourceImpl(
        supabaseClient: serviceLocator<SupabaseClient>(),
      ),
    )
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(blogRemoteDatasource: serviceLocator()),
    )
    ..registerFactory<UploadBlogUseCase>(
      () => UploadBlogUseCase(blogRepository: serviceLocator()),
    )
    ..registerFactory<GetAllBlogsUseCase>(
      () => GetAllBlogsUseCase(blogRepository: serviceLocator()),
    )
    ..registerLazySingleton(
      () => BlogBloc(
        uploadBlogUseCase: serviceLocator(),
        getAllBlogs: serviceLocator(),
      ),
    );
}
