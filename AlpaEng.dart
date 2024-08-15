import 'package:flutter/material.dart';
import 'package:test_grad/model/ArabicModel.dart';
import 'package:test_grad/views/IntroEnglish.dart';


class Alpa_Eng extends StatefulWidget {
  const Alpa_Eng({super.key});

  @override
  State<Alpa_Eng> createState() => _Alpa_EngState();
}

class _Alpa_EngState extends State<Alpa_Eng> {
  List<ArabicModel> AlpaEngList = [
    ArabicModel(image: "assets/images/alphabets/A.png", text: "Aa"),
    ArabicModel(image: "assets/images/alphabets/B.png", text: "Bb"),
    ArabicModel(image: "assets/images/alphabets/C.png", text: "Cc"),
    ArabicModel(image: "assets/images/alphabets/D.png", text: "Dd"),
    ArabicModel(image: "assets/images/alphabets/E.png", text: "Ee"),
    ArabicModel(image: "assets/images/alphabets/F.png", text: "Ff"),
    ArabicModel(image: "assets/images/alphabets/G.png", text: "Gg"),
    ArabicModel(image: "assets/images/alphabets/H.png", text: "Hh"),
    ArabicModel(image: "assets/images/alphabets/I.png", text: "Ii"),
    ArabicModel(image: "assets/images/alphabets/J.png", text: "Jj"),
    ArabicModel(image: "assets/images/alphabets/K.png", text: "Kk"),
    ArabicModel(image: "assets/images/alphabets/L.png", text: " Ll"),
    ArabicModel(image: "assets/images/alphabets/M.png", text: " Mm "),
    ArabicModel(image: "assets/images/alphabets/N.png", text: " Nn"),
    ArabicModel(image: "assets/images/alphabets/O.png", text: " Oo"),
    ArabicModel(image: "assets/images/alphabets/P.png", text: " Pp"),
    ArabicModel(image: "assets/images/alphabets/Q.png", text: " Qq "),
    ArabicModel(image: "assets/images/alphabets/R.png", text: " Rr "),
    ArabicModel(image: "assets/images/alphabets/S.png", text: " Ss"),
    ArabicModel(image: "assets/images/alphabets/T.png", text: " Tt"),
    ArabicModel(image: "assets/images/alphabets/U.png", text: "Uu"),
    ArabicModel(image: "assets/images/alphabets/V.png", text: "Vv"),
    ArabicModel(image: "assets/images/alphabets/W.png", text: "Ww"),
    ArabicModel(image: "assets/images/alphabets/X.png", text: "Xx"),
    ArabicModel(image: "assets/images/alphabets/Y.png", text: "Yy"),
    ArabicModel(image: "assets/images/alphabets/Z.png", text: "Zz"),
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
            "                   Letters",
            style: TextStyle(
              //fontFamily: 'Lobster',
              fontSize: 32,
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
                MaterialPageRoute(builder: (context) => Home_Page_English())),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: SizedBox(
            height: 490,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: _buildListItem,
              itemCount: AlpaEngList.length,
            ),
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    ArabicModel NumArabic = AlpaEngList[index];
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
