import 'package:flutter/material.dart';
import 'package:test_grad/model/ArabicModel.dart';
import 'package:test_grad/views/IntroArabic.dart';


class Alpa_Arabic extends StatefulWidget {
  const Alpa_Arabic({super.key});

  @override
  State<Alpa_Arabic> createState() => _Alpa_ArabicState();
}

class _Alpa_ArabicState extends State<Alpa_Arabic> {
  List<ArabicModel> AlpaArabicList = [
    ArabicModel(image: "assets/images/AlpaArabic/Alef.jpg", text: "ا"),
    ArabicModel(image: "assets/images/AlpaArabic/Ba.jpg", text: "ب"),
    ArabicModel(image: "assets/images/AlpaArabic/ta.jpg", text: "ت"),
    ArabicModel(image: "assets/images/AlpaArabic/tha.jpg", text: "ث"),
    ArabicModel(image: "assets/images/AlpaArabic/gim.jpg", text: "ج"),
    ArabicModel(image: "assets/images/AlpaArabic/ha.jpg", text: "ح"),
    ArabicModel(image: "assets/images/AlpaArabic/kha.jpg", text: "خ"),
    ArabicModel(image: "assets/images/AlpaArabic/dal.jpg", text: "د"),
    ArabicModel(image: "assets/images/AlpaArabic/zal.jpg", text: "ذ"),
    ArabicModel(image: "assets/images/AlpaArabic/raa.jpg", text: "ر"),
    ArabicModel(image: "assets/images/AlpaArabic/zen.jpg", text: "ز"),
    ArabicModel(image: "assets/images/AlpaArabic/sen.jpg", text: " س"),
    ArabicModel(image: "assets/images/AlpaArabic/shen.jpg", text: " ش "),
    ArabicModel(image: "assets/images/AlpaArabic/sad.jpg", text: " ص"),
    ArabicModel(image: "assets/images/AlpaArabic/dadd.jpg", text: " ض"),
    ArabicModel(image: "assets/images/AlpaArabic/dah.jpg", text: " ط"),
    ArabicModel(image: "assets/images/AlpaArabic/zah.jpg", text: " ظ "),
    ArabicModel(image: "assets/images/AlpaArabic/aen.jpg", text: " ع "),
    ArabicModel(image: "assets/images/AlpaArabic/gen.jpg", text: " غ"),
    ArabicModel(image: "assets/images/AlpaArabic/fa.jpg", text: " ف"),
    ArabicModel(image: "assets/images/AlpaArabic/af.jpg", text: "ق"),
    ArabicModel(image: "assets/images/AlpaArabic/aff.jpg", text: "ك"),
    ArabicModel(image: "assets/images/AlpaArabic/lam.jpg", text: "ل"),
    ArabicModel(image: "assets/images/AlpaArabic/mem.jpg", text: "م"),
    ArabicModel(image: "assets/images/AlpaArabic/non.jpg", text: "ن"),
    ArabicModel(image: "assets/images/AlpaArabic/haah.jpg", text: "ه"),
    ArabicModel(image: "assets/images/AlpaArabic/waw.jpg", text: "و"),
    ArabicModel(image: "assets/images/AlpaArabic/yaa.jpg", text: "ي"),
    ArabicModel(image: "assets/images/AlpaArabic/ta2.jpg", text: " ة"),
    ArabicModel(image: "assets/images/AlpaArabic/el.jpg", text: " ال "),
    ArabicModel(image: "assets/images/AlpaArabic/amza.jpg", text: " ء"),
    ArabicModel(image: "assets/images/AlpaArabic/no.jpg", text: " لا"),
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
            "               الحروف",
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
              itemCount: AlpaArabicList.length,
            ),
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    ArabicModel NumArabic = AlpaArabicList[index];
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 4.0,
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
                  height: MediaQuery.of(context).size.height / 3.2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  NumArabic.text,
                  style: const TextStyle(
                      fontSize: 80,
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
