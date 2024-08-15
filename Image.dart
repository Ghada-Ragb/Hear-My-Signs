import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  final String image;

  Images({
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Container(
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width / 1.8,
              height: MediaQuery.of(context).size.height / 1.8,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
