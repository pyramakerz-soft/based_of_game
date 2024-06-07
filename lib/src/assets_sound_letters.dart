abstract class AssetsSoundLetters {
  static const String mainPathOfSound = 'assets/';

  static String getPathOfLetter({required String letter}) {
    return "$mainPathOfSound$letter.mp3";
  }

  static getSoundOfLetter({required String mainGameLetter}) {
    return getPathOfLetter(letter: mainGameLetter.toLowerCase());
  }
}
