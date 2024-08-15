import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

class Fpage_Speech extends StatefulWidget {
  const Fpage_Speech({super.key});

  @override
  State<Fpage_Speech> createState() => _Fpage_SpeechState();
}

class _Fpage_SpeechState extends State<Fpage_Speech> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _recognizedText = '';
  double _confidence = 0.0;

  @override
  void initState() {
    super.initState();
    // Load the TFLite model on initialization
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await _speech.initialize();
    if (!mounted) return;
    setState(() {
      _isListening = hasSpeech;
    });
  }

  void _startListening() {
    _speech.listen(
      localeId: 'en_US',
      onResult: (result) {
        setState(() {
          _recognizedText = result.recognizedWords;
          _confidence = result.confidence;
        });
      },
    );
    setState(() {
      _isListening = true;
    });
  }

  void _stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          onTap: () => Navigator.pop(context),
        ),
        title: const Text(
          "Communication",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _speech.isListening
                    ? "Listening...."
                    : _isListening
                        ? "Tap the microphone to start listening..."
                        : "Speech Not available",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 23, 23),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  _recognizedText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
              ),
            ),
            if (!_speech.isListening && _confidence > 0)
              Text(
                'Confidence: ${(_confidence * 100).toStringAsFixed(1)}%',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Padding(
              padding: EdgeInsets.only(bottom: 50, right: 20),
              child: Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF649192),
                    minimumSize: Size(90, 60),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Signs",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        //endRadius: 110,
        duration: const Duration(milliseconds: 2000),
        //repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF649192),
          onPressed: _speech.isListening ? _stopListening : _startListening,
          tooltip: 'Listen',
          child: Icon(
            _speech.isNotListening ? Icons.mic_off : Icons.mic,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
