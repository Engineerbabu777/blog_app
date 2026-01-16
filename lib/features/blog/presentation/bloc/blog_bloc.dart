import 'dart:io';

import 'package:blog_app/features/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/features/blog/domain/usecases/upload_blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlogUseCase _uploadBlogUseCase;

  BlogBloc({required UploadBlogUseCase uploadBlogUseCase})
    : _uploadBlogUseCase = uploadBlogUseCase,
      super(BlogInitial()) {
    on<BlogEvent>((event, emit) {
      emit(BlogLoading());
    });
    on<BlogUploadEvent>(_onBlogUpload);
  }

  void _onBlogUpload(BlogUploadEvent event, Emitter<BlogState> emit) async {
    final res = await _uploadBlogUseCase.call(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );

    res.fold(
      (error) {
        emit(BlogError(message: error.message.toString()));
      },
      (success) {
        emit(BlogSuccess(blog: success));
      },
    );
  }
}
