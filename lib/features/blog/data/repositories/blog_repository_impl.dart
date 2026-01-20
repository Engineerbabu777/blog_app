import 'dart:io';

import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/features/blog/data/datasources/blog_remote_datasource.dart';
import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:blog_app/features/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDatasource _blogRemoteDatasourceImpl;

  BlogRepositoryImpl({required BlogRemoteDatasource blogRemoteDatasource})
    : _blogRemoteDatasourceImpl = blogRemoteDatasource;

  @override
  Future<Either<Failure, BlogEntity>> uploadBlog({
    required File image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    try {
      BlogModel blogModel = BlogModel(
        id: const Uuid().v1(),
        posterId: posterId,
        title: title,
        content: content,
        imageUrl: '',
        topics: topics,
        updatedAt: DateTime.now(),
      );

      final blogImage = await _blogRemoteDatasourceImpl.uploadBlogImage(
        image: image,
        blog: blogModel,
      );

      blogModel = blogModel.copyWith(imageUrl: blogImage);

      final uploadedBlog = await _blogRemoteDatasourceImpl.uploadBlog(
        blogModel,
      );

      return Right(uploadedBlog);
    } on ServerException catch (e) {
      return Left(
        Failure(
          e.message.isNotEmpty
              ? e.message.toString()
              : "An unexpected error occur in upload blog",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BlogEntity>>> getAllBlogs() async {
    try {
      final blogs = await _blogRemoteDatasourceImpl.getAllBlogs();

      print("BLOGGS $blogs");

      return Right(blogs);
    } on ServerException catch (e) {
      return Left(
        Failure(
          e.message.isNotEmpty
              ? e.message.toString()
              : "An unexpected error occur in fetching blogs",
        ),
      );
    }
  }
}
