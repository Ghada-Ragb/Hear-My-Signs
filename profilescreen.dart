import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_grad/helper/showsnackbar.dart';
import 'package:test_grad/screens/editprofile/ChangePasswordScreen.dart';
import 'package:test_grad/screens/editprofile/deleteAccount.dart';
import 'package:test_grad/screens/editprofile/edit-photo.dart';
import 'package:test_grad/screens/login_page.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  Uint8List? _image;
  Future<void> _pickImage() async {
    Uint8List ing = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color(0xFF6FA1A2),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _image != null
                  ? CircleAvatar(
                      radius: 70,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFF3F4F9),
                          radius: 17,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt,
                                size: 25, color: Colors.grey),
                            onPressed: _pickImage,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 20.0),
              Text(
                FirebaseAuth.instance.currentUser!.displayName ?? "no name",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20.0),
              SizedBox(height: 80.0),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                        showSimpleAlertDialog(context, 'User logged out');

                        // You can navigate to another screen or perform additional actions after logging out
                      } catch (e) {
                        showSimpleAlertDialog(context, 'Error logging out: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      //primary: Color(0xFF6FA1A2),
                      backgroundColor:
                          Color(0xFF6FA1A2), // Set the desired color
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DeleteAccountScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Color(0xFF6FA1A2),
                    backgroundColor: Color(0xFF6FA1A2), // Set the desired color
                  ),
                  child: Text('Delete Account',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Color(0xFF6FA1A2),
                    backgroundColor: Color(0xFF6FA1A2), // Set the desired color
                  ),
                  child: Text('Change password',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
