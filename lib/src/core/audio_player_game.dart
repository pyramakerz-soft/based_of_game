import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerGame {
  static AudioPlayer playerWrong = AudioPlayer();
  static AudioPlayer playerCorrect = AudioPlayer();
  static Future startPlaySoundOfWrong(
      {AudioPlayer? playerWrong2, required String soundPath}) async {
    try {
      await (playerWrong2 ?? playerWrong).play(AssetSource(soundPath));
      await (playerWrong2 ?? playerWrong).setVolume(1);
      await (playerWrong2 ?? playerWrong).resume();
    } catch (e) {
      log('error:$e');
    }
  }

  static Future startPlaySoundOfCorrect(
      {AudioPlayer? playerCorrect2, required String soundPath}) async {
    try {
      await (playerCorrect2 ?? playerCorrect).play(AssetSource(soundPath));
      await (playerCorrect2 ?? playerCorrect).setVolume(1);
      await (playerCorrect2 ?? playerCorrect).resume();
    } catch (e) {
      log('error:$e');
    }
  }

  static forceStopSound() async {
    await playerCorrect.stop();
    await playerWrong.stop();
  }
}
