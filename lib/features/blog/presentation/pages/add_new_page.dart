import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddNewBlog extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlog());
  const AddNewBlog({super.key});

  @override
  State<AddNewBlog> createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Blog'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done_rounded))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                color: AppPallete.borderColor,
                dashPattern: [10, 4],
                strokeWidth: 2,
                radius: Radius.circular(10),
              ),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ICON!
                    Icon(Icons.folder_open, size: 40),
                    // SPACE!
                    SizedBox(height: 15),
                    // TEXT!
                    Text('Select your image', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // CHIPS!
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Technology', 'Bussiness', 'Programming', 'Cricket']
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Chip(
                          label: Text(e),
                          side: const BorderSide(color: AppPallete.borderColor),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
