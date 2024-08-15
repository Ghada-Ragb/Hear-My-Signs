import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
      @override
      _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      File? _image;

      Future _getImage(ImageSource source) async {
            final picker = ImagePicker();
            final pickedFile = await picker.getImage(source: source);

            setState(() {
                  if (pickedFile != null) {
                        _image = File(pickedFile.path);
                  } else {
                        print('No image selected.');
                  }
            });
      }

      Future _showImagePickerOptions() async {
            return await showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                        return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                    ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text('Choose from Gallery'),
                                          onTap: () {
                                                Navigator.pop(context);
                                                _getImage(ImageSource.gallery);
                                          },
                                    ),
                                    ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('Take a Photo'),
                                          onTap: () {
                                                Navigator.pop(context);
                                                _getImage(ImageSource.camera);
                                          },
                                    ),
                              ],
                        );
                  },
            );
      }

      void _saveImage() {
            // Implement logic to save the selected image
            print('Image saved!');
      }

      @override
      Widget build(BuildContext context) {
            return Scaffold(
                  appBar: AppBar(
                        title: Text('Image Upload Example'),
                        actions: [
                              IconButton(
                                    icon: Icon(Icons.save),
                                    onPressed: _image != null ? _saveImage : null,
                              ),
                        ],
                  ),
                  body: Center(
                        child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                    Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                                CircleAvatar(
                                                      radius: 50,
                                                      backgroundImage: _image != null ? FileImage(_image!) : null,
                                                ),
                                                IconButton(
                                                      icon: Icon(Icons.camera_alt),
                                                      onPressed: _showImagePickerOptions,
                                                ),
                                          ],
                                    ),

                              ],
                        ),
                  ),
            );
      }
}