import 'package:flutter/material.dart';
//import 'package:graduation_project/models/category_model.dart';
import 'package:test_grad/models/category_model.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 110,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3)),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Image.asset(categoryModel.image),
            ),
            Text(
              categoryModel.text,
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6FA1A2),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
