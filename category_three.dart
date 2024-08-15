import 'package:flutter/material.dart';
import 'package:test_grad/screens/category_three/camerascreen.dart';

class OpenCamera extends StatelessWidget {
  const OpenCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF3F4F9),
      appBar: AppBar(
        backgroundColor:const Color(0xff6FA1A2),
        title:const Padding(
          padding:  EdgeInsets.only(left: 120),
          child: Text(
            "Use Camera",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(70, 80, 0, 0),
          child: Image.asset("assets/images/camera.jpeg"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(70, 50, 0, 0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  CameraScreen();
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color:const Color(0xff6FA1A2),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 170,
              height: 65,
              child: const Center(
                child: Text(
                  "Open Camera",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
