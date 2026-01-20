import 'package:flutter/material.dart';

class BlogViewerPage extends StatelessWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (builder) => BlogViewerPage());
  const BlogViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar());
  }
}
