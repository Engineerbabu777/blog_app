import 'package:blog_app/features/blog/data/models/blog_model.dart';

abstract interface class BlogRemoteDatasource {
  Future<BlogModel> uploadBlog(BlogModel blog);
}
