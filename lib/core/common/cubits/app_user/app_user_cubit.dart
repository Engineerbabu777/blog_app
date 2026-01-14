import 'package:bloc/bloc.dart';
import 'package:blog_app/core/common/entities/user_entity.dart';
import 'package:meta/meta.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());
}
