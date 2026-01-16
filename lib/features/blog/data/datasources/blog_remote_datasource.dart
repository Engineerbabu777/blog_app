import 'package:blog_app/features/blog/data/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDatasource {
  Future<BlogModel> uploadBlog(BlogModel blog);
}

class BlogRemoteDatasourceImpl implements BlogRemoteDatasource {

  final SupabaseClient supabaseClient;

  @override
  Future<BlogModel> uploadBlog(BlogModel blog) {
   try {

   } catch(e) {
    
   }
  }
  
}