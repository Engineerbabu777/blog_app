import 'dart:io';

import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDatasource {
  Future<BlogModel> uploadBlog(BlogModel blog);
  Future<String> uploadBlogImage({
    required File image,
    required BlogModel blog,
  });
  Future<List<BlogModel>> getAllBlogs();
}

class BlogRemoteDatasourceImpl implements BlogRemoteDatasource {
  final SupabaseClient supabaseClient;

  BlogRemoteDatasourceImpl({required this.supabaseClient});

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
    try {
      final json = blog.toJson();
      print('Obect: $json');

      final blogData = await supabaseClient
          .from("blogs")
          .insert(blog.toJson())
          .select()
          .single();

      return BlogModel.fromJson(blogData);
    } catch (e) {
      print('Error during blog creation: $e'); // Debugging line
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadBlogImage({
    required File image,
    required BlogModel blog,
  }) async {
    try {
      await supabaseClient.storage.from("blog_images").upload(blog.id, image);

      return supabaseClient.storage.from('blog_images').getPublicUrl(blog.id);
    } catch (e) {
      print('Error during blog image uploading: $e'); // Debugging line
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      final blogsData = await supabaseClient
          .from("blogs")
          .select("*, profiles(name)");

      print("DAA: $blogsData");

      return blogsData
          .map(
            (blog) => BlogModel.fromJson(
              blog,
            ).copyWith(posterName: blog['profiles']['name']),
          )
          .toList();
    } catch (e) {
      print('Error during blogs fetching: $e'); // Debugging line
      throw ServerException(e.toString());
    }
  }
}
