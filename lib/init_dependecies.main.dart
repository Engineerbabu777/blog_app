part of 'init_dep.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependecies() async {
  // SUPABASE!
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  serviceLocator.registerLazySingleton(() => Hive.box(name: "blogs"));

  serviceLocator.registerLazySingleton(() => supabase.client);

  _initAuth();
  _initBlog();

  serviceLocator.registerFactory(() => InternetConnection());

  serviceLocator.registerLazySingleton<AppUserCubit>(() => AppUserCubit());
  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(internetConnection: serviceLocator()),
  );
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        supabaseClient: serviceLocator<SupabaseClient>(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator(), serviceLocator()),
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
    ..registerFactory<BlogLocalDatasource>(
      () => BlogLocalDatasourceImpl(box: serviceLocator<Box>()),
    )
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(
        blogRemoteDatasource: serviceLocator(),
        blogLocalDatasource: serviceLocator(),
        connectionChecker: serviceLocator(),
      ),
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
