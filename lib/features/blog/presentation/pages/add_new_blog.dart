import 'dart:io';

import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/pick_image.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';
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
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  List<String> selectedTopics = [];
  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();

    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Blog'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done_rounded))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              image != null
                  ? GestureDetector(
                    onTap: selectImage,
                    child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(image!, fit: BoxFit.cover),
                        ),
                      ),
                  )
                  : GestureDetector(
                      onTap: selectImage,
                      child: DottedBorder(
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
                              Text(
                                'Select your image',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

              SizedBox(height: 20),

              // CHIPS!
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      ['Technology', 'Bussiness', 'Programming', 'Cricket']
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  selectedTopics.contains(e)
                                      ? selectedTopics.remove(e)
                                      : selectedTopics.add(e);

                                  setState(() {});
                                },
                                child: Chip(
                                  label: Text(e),
                                  side: const BorderSide(
                                    color: AppPallete.borderColor,
                                  ),
                                  color: selectedTopics.contains(e)
                                      ? const WidgetStatePropertyAll(
                                          AppPallete.gradient1,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),

              // INPUTS!
              BlogEditor(controller: titleController, hintText: 'Blog title'),

              SizedBox(height: 10),

              BlogEditor(controller: titleController, hintText: 'Blog Content'),
            ],
          ),
        ),
      ),
    );
  }
}
