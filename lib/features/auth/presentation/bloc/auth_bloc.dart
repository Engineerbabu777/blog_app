// import 'package:blog_app/features/auth/domain/entities/user_entity.dart';
// import 'package:blog_app/features/auth/domain/use-cases/current_user.dart';
// import 'package:blog_app/features/auth/domain/use-cases/user_sign_in.dart';
// import 'package:blog_app/features/auth/domain/use-cases/user_sign_up.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final UserSignUp _userSignUp;
//   final UserSignIn _userSignIn;
//   final CurrentUser _userCurrent;

//   AuthBloc({
//     required UserSignUp userSignUp,
//     required UserSignIn userSignIn,
//     required CurrentUser currentUser,
//   }) : _userSignUp = userSignUp,
//        _userSignIn = userSignIn,
//        _userCurrent = currentUser,

//        super(AuthInitial()) {
//     // EVENT!
//     on<AuthSignUp>((event, emit) async {
//       emit(AuthLoading());
//       final res = await _userSignUp(
//         UserSignUpParams(
//           email: event.email,
//           password: event.password,
//           name: event.name,
//         ),
//       );

//       res.fold(
//         (l) => emit(
//           AuthFailure(message: l.message ?? "An unknown error occurred"),
//         ),
//         (r) => emit(AuthSuccess(r)),
//       );
//     });

//     // EVENT!
//     on<AuthSignIn>((event, emit) async {
//       emit(AuthLoading());

//       final res = await _userSignIn(
//         UserSignInParams(email: event.email, password: event.password),
//       );

//       print("response $res");

//       res.fold(
//         (l) => emit(
//           AuthFailure(message: l.message ?? "An unknown error occurred"),
//         ),
//         (r) => emit(AuthSuccess(r)),
//       );
//     });

//     // EVENT!
//   }
// }

import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/common/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/use-cases/current_user.dart';
import 'package:blog_app/features/auth/domain/use-cases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/use-cases/user_sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final CurrentUser _userCurrent;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  }) : _userSignUp = userSignUp,
       _userSignIn = userSignIn,
       _userCurrent = currentUser,
       _appUserCubit = appUserCubit,

       super(AuthInitial()) {
    on<AuthEvent>((_, emit) {
      emit(AuthLoading());
    });
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthIsUserLoggedIn>(_onAuthIsUserLoggedIn);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    // emit(AuthLoading());
    final res = await _userSignUp(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );

    res.fold(
      (l) =>
          emit(AuthFailure(message: l.message ?? "An unknown error occurred")),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    // emit(AuthLoading());

    final res = await _userSignIn(
      UserSignInParams(email: event.email, password: event.password),
    );

    print("response $res");

    res.fold(
      (l) =>
          emit(AuthFailure(message: l.message ?? "An unknown error occurred")),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthIsUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    // emit(AuthLoading());
    final res = await _userCurrent(NoParams());

    res.fold(
      (l) =>
          emit(AuthFailure(message: l.message ?? "An unknown error occurred")),
      (r) {
        if (r == null) {
          emit(AuthFailure(message: "User Not Logged In!"));
        } else {
          print("current user ${r.email}");

          _emitAuthSuccess(r, emit);
        }
      },
    );
  }

  void _emitAuthSuccess(UserEntity r, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(r);
    emit(AuthSuccess(r));
  }
}
