import 'package:blog_app/features/auth/domain/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/use-cases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/use-cases/user_sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({required UserSignUp userSignUp, required UserSignIn userSignIn})
    : _userSignUp = userSignUp,
      _userSignIn = userSignIn,
      super(AuthInitial()) {
    // EVENT!
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignUp(
        UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name,
        ),
      );

      res.fold(
        (l) => emit(
          AuthFailure(message: l.message ?? "An unknown error occurred"),
        ),
        (r) => emit(AuthSuccess(r)),
      );
    });

    // EVENT!
    on<AuthSignIn>((event, emit) async {
      emit(AuthLoading());

      final res = await _userSignIn(
        UserSignInParams(email: event.email, password: event.password),
      );

      res.fold(
        (l) => emit(
          AuthFailure(message: l.message ?? "An unknown error occurred"),
        ),
        (r) => emit(AuthSuccess(r)),
      );
    });
  }
}
