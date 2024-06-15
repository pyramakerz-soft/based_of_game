import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';

abstract class TalkTts {
  static FlutterTts flutterTts = FlutterTts();

  static String data = '';
  static Future startTalk(
      {required String text,
      Function? actionOfStart,
      Function? actionPause,
      Function? actionCancel,
      Function? actionComplete}) async {
    await flutterTts.setLanguage("en-US");
    data = text;
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.4);
    flutterTts.setStartHandler(() {
      if (actionOfStart != null) {
        actionOfStart();
      }
    });
    flutterTts.setCompletionHandler(() {
      if (actionComplete != null) {
        actionComplete();
      }
    });
    flutterTts.setCancelHandler(() {
      if (actionCancel != null) {
        actionCancel();
      }
    });
    flutterTts.setPauseHandler(() {
      if (actionPause != null) {
        actionPause();
      }
    });
    flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(text);
  }

  static stopTalk() async {
    await flutterTts.stop();
  }
}
