import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = 210,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF649192),
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: onPressed,
          label: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
//const Color.fromARGB(155, 160, 102, 180),