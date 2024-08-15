import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return "Field is required";
          }
        },
        controller: widget.controller,
        obscureText: widget.obscureText && !_confirmPasswordVisible,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(15, 15),
            ),
            borderSide: BorderSide(color: Color(0xFFECECEC)),
          ),
          focusedBorder: OutlineInputBorder(),
          fillColor: Color(0xFFECECEC),
          filled: true,
          prefixIcon: Icon(
            widget.icon,
            color: Color(0xFF649292),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _confirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Color(0xFF649292),
                  ),
                  onPressed: () {
                    setState(() {
                      _confirmPasswordVisible = !_confirmPasswordVisible;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

class ButtonReuse extends StatelessWidget {
  const ButtonReuse({super.key, required this.text, this.onTap});
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF649292), borderRadius: BorderRadius.circular(10)),
        width: 100,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
