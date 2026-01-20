part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogError extends BlogState {
  final String message;

  BlogError({required this.message});
}

final class BlogDisplaySuccess extends BlogState {
  final List<BlogEntity> blogs;

  BlogDisplaySuccess({required this.blogs});
}

final class BlogUploadSuccess extends BlogState {}
