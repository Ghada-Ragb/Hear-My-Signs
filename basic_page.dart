import 'package:flutter/material.dart';
import 'package:test_grad/models/category_model.dart';
import 'package:test_grad/screens/category_four/category_four.dart';
import 'package:test_grad/screens/category_one/learning.dart';
import 'package:test_grad/screens/category_three/category_three.dart';
import 'package:test_grad/screens/category_two/home_page.dart';
import 'package:test_grad/screens/editprofile/profilescreen.dart';
import 'package:test_grad/widget/four_categoey.dart';

class BasicPage extends StatelessWidget {
  BasicPage({super.key});
  List<CategoryModel> category = [
    CategoryModel(image: 'assets/images/Vector1.png', text: 'Learning'),
    CategoryModel(
        image: 'assets/images/Translate-01 1.png', text: 'Communication'),
    CategoryModel(image: 'assets/images/Group.png', text: 'Open camera'),
    CategoryModel(image: 'assets/images/Vector (Traced).png', text: 'Videos')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F9),
      appBar: AppBar(
        backgroundColor: Color(0xFF6FA1A2),
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            icon: Icon(Icons.person)),
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Text(
            'Hear My Signs',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
                fontSize: 21),
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width / .1,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/basic.jpeg'),
            const SizedBox(
              height: 38,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Learn_Me_Signs();
                      },
                    ),
                  );
                },
                child: Categories(
                  categoryModel: category[0],
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 15)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Fpage_Speech();
                      },
                    ),
                  );
                },
                child: Categories(
                  categoryModel: category[1],
                ),
              ),
            ]),
            const SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OpenCamera();
                      },
                    ),
                  );
                },
                child: Categories(
                  categoryModel: category[2],
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 15)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Videos();
                      },
                    ),
                  );
                },
                child: Categories(
                  categoryModel: category[3],
                ),
              )
            ])
          ]),
        ),
      ),
    );
  }
}
