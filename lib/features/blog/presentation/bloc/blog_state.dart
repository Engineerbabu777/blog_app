part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogError extends BlogState {
  final String message;

  BlogError({required this.message});
}

final class BlogSuccess extends BlogState {

}
