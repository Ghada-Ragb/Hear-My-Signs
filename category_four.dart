import 'package:flutter/material.dart';

class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffF3F4F9),
      appBar: AppBar(backgroundColor: Color(0xFF6FA1A2),
      title: Padding(
        padding: const EdgeInsets.only(left:120),
        child: Text(" Videos",style: TextStyle(
           color: Colors.white,
           fontFamily: 'Pacifico',
        ),
        ),
      ),

      )
      
      ,);
  }
}