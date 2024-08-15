import 'package:flutter/material.dart';
import 'package:test_grad/model/ArabicModel.dart';
import 'package:test_grad/views/IntroArabic.dart';


class NumArabic extends StatefulWidget {
  const NumArabic({super.key});

  @override
  State<NumArabic> createState() => _NumArabicState();
}

class _NumArabicState extends State<NumArabic> {
  List<ArabicModel> NumArabicList = [
    ArabicModel(image: "assets/images/NumArabic/zero.jpg", text: "(0)صفر"),
    ArabicModel(image: "assets/images/NumArabic/one.jpg", text: "(1)واحد"),
    ArabicModel(image: "assets/images/NumArabic/two.jpg", text: "(2)اثنان"),
    ArabicModel(image: "assets/images/NumArabic/three.jpg", text: "(3)ثلاثه"),
    ArabicModel(image: "assets/images/NumArabic/four.jpg", text: "(4)اربعه"),
    ArabicModel(image: "assets/images/NumArabic/five.jpg", text: "(5)خمس"),
    ArabicModel(image: "assets/images/NumArabic/six.jpg", text: "(6)سته"),
    ArabicModel(image: "assets/images/NumArabic/seven.jpg", text: "(7)سبع"),
    ArabicModel(image: "assets/images/NumArabic/eight.jpg", text: "(8)ثامن"),
    ArabicModel(image: "assets/images/NumArabic/nine.jpg", text: "(9)تسع"),
    ArabicModel(image: "assets/images/NumArabic/ten.jpg", text: "(10)عشر"),
    ArabicModel(
        image: "assets/images/NumArabic/eleven.jpg", text: "(11)احد عشر"),
    ArabicModel(
        image: "assets/images/NumArabic/twelev.jpg", text: "(12)اثنا عشر "),
    ArabicModel(
        image: "assets/images/NumArabic/threeten.jpg", text: "(13)ثلاثه عشر"),
    ArabicModel(
        image: "assets/images/NumArabic/fourteen.jpg", text: "(14)اربعه عشر"),
    ArabicModel(
        image: "assets/images/NumArabic/fiveteen.jpg", text: "(15)خمسه عشر"),
    ArabicModel(
        image: "assets/images/NumArabic/sixteen.jpg", text: "(16)سته عشر "),
    ArabicModel(
        image: "assets/images/NumArabic/seventeen.jpg", text: "(17)سابعه عشر "),
    ArabicModel(
        image: "assets/images/NumArabic/eighteen.jpg", text: "(18)ثامن عشر"),
    ArabicModel(
        image: "assets/images/NumArabic/nineteen.jpg", text: "(19)تسعه عشر"),
    ArabicModel(
        image: "assets/images/NumArabic/twentey.jpg", text: "(20)عشرون"),
    ArabicModel(
        image: "assets/images/NumArabic/threety.jpg", text: "(30)ثلاثون"),
    ArabicModel(
        image: "assets/images/NumArabic/thosand.jpg", text: "(100)مائه"),
    ArabicModel(
        image: "assets/images/NumArabic/thounndzero.jpg", text: "(1000)الف"),
    ArabicModel(
        image: "assets/images/NumArabic/thoundtwozero.jpg",
        text: "(1000000)مليون"),
    ArabicModel(image: "assets/images/NumArabic/onetow.jpg", text: "(1/2)نصف"),
    ArabicModel(
        image: "assets/images/NumArabic/onethree.jpg", text: "(1/3)ثلث"),
    ArabicModel(image: "assets/images/NumArabic/onefour.jpg", text: "(1/4)ربع"),
    ArabicModel(
        image: "assets/images/NumArabic/onefive.jpg", text: " (1/5)خمس"),
    ArabicModel(
        image: "assets/images/NumArabic/onesix.jpg", text: " (1/6)سدس "),
    ArabicModel(
        image: "assets/images/NumArabic/oneseven.jpg", text: " (1/7)سبع"),
    ArabicModel(
        image: "assets/images/NumArabic/oneeight.jpg", text: " (1/8)ثمن"),
    ArabicModel(
        image: "assets/images/NumArabic/onenine.jpg", text: " (1/9)تسع"),
    ArabicModel(
        image: "assets/images/NumArabic/oneten.jpg", text: " (1/10)عشر "),
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
            "                   الارقام",
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
              itemCount: NumArabicList.length,
            ),
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    ArabicModel NumArabic = NumArabicList[index];
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
                      fontSize: 40,
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
