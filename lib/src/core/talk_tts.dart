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
      bool? isArabic,
      Function? actionComplete}) async {
    if (isArabic == true) {
      await flutterTts.setLanguage("ar");
    } else {
      await flutterTts.setLanguage("en-US");
    }
    data = text;
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.3);
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
