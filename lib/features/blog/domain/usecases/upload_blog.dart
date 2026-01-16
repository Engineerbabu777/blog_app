import 'dart:io';

import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class UploadBlogUseCase implements UseCase<BlogEntity, UploadBlogParams> {
  final BlogRepository _blogRepository;

  UploadBlogUseCase({required BlogRepository blogRepository})
    : _blogRepository = blogRepository;

  @override
  Future<Either<Failure, BlogEntity>> call(UploadBlogParams params) async {
    return await _blogRepository.uploadBlog(
      content: params.content,
      title: params.content,
      image: params.image,
      posterId: params.content,
      topics: params.topics,
    );
  }
}

class UploadBlogParams {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
