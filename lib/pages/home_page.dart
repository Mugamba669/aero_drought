import 'dart:io';

import 'package:aero_drought/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for a modern feel
      appBar: AppBar(
        centerTitle: true, // Center the title for a balanced look
        elevation: 0, // Remove shadow for a flat design
        backgroundColor: Colors.green, // Brand color
        title: Text(
          'AeroDrought',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch to fill width
          children: [
            // Add some top padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BottomSheet(
                          onClosing: () {},
                          builder: (context) {
                            return SizedBox(
                              height: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    child: IconButton(
                                      iconSize: 55,
                                      onPressed: () {
                                        picker
                                            .pickImage(
                                                source: ImageSource.camera)
                                            .then((value) {
                                          setState(() {
                                            file = File(value!.path);
                                          });
                                        });
                                      },
                                      icon: const Icon(Icons.camera),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 50,
                                    child: IconButton(
                                      iconSize: 55,
                                      onPressed: () {
                                        // ignore: invalid_use_of_visible_for_testing_member
                                        picker
                                            .pickImage(
                                          source: ImageSource.gallery,
                                        )
                                            .then((value) {
                                          if (value != null) {
                                            setState(() {
                                              file = File(value.path);
                                            });
                                          }
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add_photo_alternate_sharp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      });
                },
                child: Card(
                  elevation: 6, // Add elevation for a shadow effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upload Image',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const Icon(
                          Icons.cloud_upload,
                          size: 30,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30), // Add spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Identify drought-resistant crops that can be grown using aeroponics.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[700],
                      fontSize: 16,
                      height: 1.4,
                    ),
              ),
            ),
            if (file != null)
              GestureDetector(
                child: Image.file(
                  file!,
                  width: constraints.maxWidth * 0.8,
                  height: constraints.maxWidth * 0.8,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Routes.go(Routes.results);
                },
              ),
          ],
        );
      }),
    );
  }
}
