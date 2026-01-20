part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class BlogUploadEvent extends BlogEvent {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  BlogUploadEvent({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}

final class GetAllBlogsEvent extends BlogEvent {
  final String id;
  final String posterId;
  final String title;
  final String content;
  final String imageUrl;
  final List<String> topics;
  final DateTime updatedAt;
  final String? posterName;

  GetAllBlogsEvent({
    required this.id,
    required this.posterId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.topics,
    required this.updatedAt,
    required this.posterName,
  });
}
