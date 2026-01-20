import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/utils/show_snackbar.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/features/blog/presentation/pages/add_new_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => BlogPage());
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(GetAllBlogsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AddNewBlog.route());
            },
            icon: Icon(CupertinoIcons.add_circled),
          ),
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogError) {
            showSnackbBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const CustomLoader();
          }

          if (state is BlogDisplaySuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final blog = state.blogs[index];

                print("AAA $blog");
                print("BBBB $state");

                return Text(blog.title);
              },
              itemCount: state.blogs.length,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
