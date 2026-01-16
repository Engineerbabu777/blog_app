import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDatasource {
  Future<BlogModel> uploadBlog(BlogModel blog);
}

class BlogRemoteDatasourceImpl implements BlogRemoteDatasource {

  final SupabaseClient supabaseClient;

  BlogRemoteDatasourceImpl({required this.supabaseClient});

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) async {
   try {
    final blogData = await supabaseClient.from("blogs").insert(blog.toJson());
    return BlogModel.fromJson(blogData.first);

   } catch(e) {

   }
  }
  
}