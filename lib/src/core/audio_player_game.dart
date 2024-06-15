import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerGame {
  static AudioPlayer playerWrong = AudioPlayer();
  static AudioPlayer playerCorrect = AudioPlayer();
  static Future startPlaySoundOfWrong({required String soundPath}) async {
    try {
      await playerWrong.play(AssetSource(soundPath));
      await playerWrong.setVolume(1);
      await playerWrong.resume();
    } catch (e) {
      log('error:$e');
    }
  }

  static Future startPlaySoundOfCorrect({required String soundPath}) async {
    try {
      await playerCorrect.play(AssetSource(soundPath));
      await playerCorrect.setVolume(1);
      await playerCorrect.resume();
    } catch (e) {
      log('error:$e');
    }
  }

  static forceStopSound() async {
    await playerCorrect.stop();
    await playerWrong.stop();
  }
}
