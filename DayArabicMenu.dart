import 'package:flutter/material.dart';
import 'package:test_grad/model/ArabicModel.dart';
import 'package:test_grad/views/IntroArabic.dart';


class DayArabicMenu extends StatefulWidget {
  @override
  State<DayArabicMenu> createState() => _DayArabicMenuState();
}

class _DayArabicMenuState extends State<DayArabicMenu> {
  List<ArabicModel> DayArabicList = [
    ArabicModel(image: "assets/images/Days(Week)/Sat.jpg", text: "السبت"),
    ArabicModel(image: "assets/images/Days(Week)/Sun.jpg", text: "الاحد"),
    ArabicModel(image: "assets/images/Days(Week)/Mon.jpg", text: "الاثنين"),
    ArabicModel(image: "assets/images/Days(Week)/Tu.jpg", text: "الثلاثاء"),
    ArabicModel(image: "assets/images/Days(Week)/We.jpg", text: "الاربعاء"),
    ArabicModel(image: "assets/images/Days(Week)/Th.jpg", text: "الخميس"),
    ArabicModel(image: "assets/images/Days(Week)/Fri.jpg", text: "الجمعه")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 248, 253),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 10,
          shadowColor: Color.fromARGB(255, 245, 240, 240),
          title: const Text(
            "                   الايام",
            style: TextStyle(
              //fontFamily: 'Lobster',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 139, 71, 14),
            ),
          ),
          leading: GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 40,
              ),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home_Page_Arabic())),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SizedBox(
            height: 490,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: _buildListItem,
              itemCount: DayArabicList.length,
            ),
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    ArabicModel NumArabic = DayArabicList[index];
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 7.4,
        child: Card(
          color: Color.fromARGB(255, 205, 205, 205),
          elevation: 12,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  NumArabic.image,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: MediaQuery.of(context).size.height / 2.8,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  NumArabic.text,
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
