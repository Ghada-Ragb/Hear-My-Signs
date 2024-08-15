import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_grad/screens/editprofile/profilescreen.dart';
import 'package:test_grad/screens/signin_page.dart';

class DeleteAccountScreen extends StatelessWidget {
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
            Text('Delete Account', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Color(0xFF6FA1A2),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 350.0,
          height: 500.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF6FA1A2),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.delete_rounded, color: Colors.red, size: 60),
                SizedBox(height: 100.0),
                Text(
                  'You Are About To Delete Your Account',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Are you sure?',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                SizedBox(height: 80.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 100.0),
                    ElevatedButton(
                      child: Text('Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        //primary: Color(0xFF6FA1A2),
                        backgroundColor: Color(0xFF6FA1A2),
                      ),
                    ),
                    SizedBox(width: 40.0),
                    ElevatedButton(
                      child: Text('Delete',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                      onPressed: () async {
                        try {
                          await deleteAccount();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Sign_In()),
                          );
                        } catch (e) {
                          // Handle account deletion errors
                          print('Error during account deletion: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.red,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> deleteAccount() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      // Delete the user account
      await user?.delete();
    } catch (e) {
      // Handle account deletion errors
      print('Error during account deletion: $e');
    }
  }
}
