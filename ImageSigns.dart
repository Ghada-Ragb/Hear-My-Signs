import 'package:flutter/material.dart';
import 'package:test_grad/screens/category_two/Image.dart';
import 'package:test_grad/screens/category_two/home_page.dart';

class ImageSigns extends StatelessWidget {
  ImageSigns({super.key});
  final List ImageModel = [
    "assets/images/image1.jpeg",
    "assets/images/image2.jpeg",
    "assets/images/image3.jpeg",
    "assets/images/image1.jpeg",
    "assets/images/image2.jpeg",
    "assets/images/image3.jpeg",
    "assets/images/image1.jpeg",
    "assets/images/image2.jpeg",
    "assets/images/image3.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Images Sign",
          style: TextStyle(
            // fontFamily: "Lobster",
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF649192),
        elevation: 0.0,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 40,
            ),
          ),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Fpage_Speech())),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ImageModel.length,
            itemBuilder: (context, index) {
              return Images(
                image: ImageModel[index],
              );
            }),
      ),
    );
  }
}



























































































/*import 'package:flutter/material.dart';
import 'package:speech_text/Speech_To_Text.dart';
import 'package:video_player/video_player.dart';

class VideoSigns extends StatefulWidget {
  const VideoSigns({super.key});

  @override
  State<VideoSigns> createState() => _VideoSignsState();
}

class _VideoSignsState extends State<VideoSigns> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset("assets/vid.mp4")
      ..initialize().then((value) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back_ios,
              color: const Color(0xFF649192),
              size: 40,
            ),
          ),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => Speech_ToText())),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF649192), width: 4)),
              child: Center(
                child: controller.value.isInitialized
                    ? AspectRatio(
                        child: VideoPlayer(controller),
                        aspectRatio: controller.value.aspectRatio,
                      )
                    : Container(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF649192),
                      minimumSize: const Size(70, 40),
                    ),
                    onPressed: () async {
                      Duration? value = await controller.position;
                      var d = value! - Duration(seconds: 5);
                      controller.seekTo(Duration(seconds: d.inSeconds));
                    },
                    child: const Text(
                      "<<",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF649192),
                      minimumSize: const Size(70, 40),
                    ),
                    onPressed: () {
                      controller.play();
                    },
                    child: const Icon(Icons.play_arrow_rounded),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF649192),
                      minimumSize: Size(70, 40),
                    ),
                    onPressed: () {
                      controller.pause();
                    },
                    child: const Icon(Icons.pause),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF649192),
                      minimumSize: const Size(70, 40),
                    ),
                    onPressed: () async {
                      Duration? d = await controller.position;
                      var val = d! + Duration(seconds: 5);
                      controller.seekTo(val);
                    },
                    child: const Text(
                      ">>",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
