import '../game_types/game_phonatics_types.dart';
import 'basic_of_chapter.dart';
import 'basic_of_game.dart';

abstract class BaseOfGames {
  static String phonics = 'Phonics';
  static String arabic = 'Arabic';
  static List<int> getTheStarsAddState(int number) {
    if (number % 3 == 0) {
      return List.generate(3, (index) => (number / 3).round()).toList();
    } else {
      int lower = (number ~/ 3) * 3;
      int upper = lower + 3;
      int result = (number - lower < upper - number) ? lower : upper;
      if (result < number) {
        return [
          (result / 3).round(),
          (result / 3 + 1).round(),
          (result / 3).round()
        ];
      } else {
        return [
          (result / 3 - 1).round(),
          (result / 3).round(),
          (result / 3).round()
        ];
      }
    }
  }

  static List<Type> listOfChapterOfPhonetics = [
    SPhonetics,
    APhonetics,
    FPhonetics,
    MPhonetics,
    TPhonetics,
    CPhonetics,
    RPhonetics,
    IPhonetics,
    PPhonetics,
    HPhonetics,
    JPhonetics,
    UPhonetics,
    LPhonetics,
    BPhonetics,
    OPhonetics,
    GPhonetics,
    DPhonetics,
    WPhonetics,
    EPhonetics,
    NPhonetics,
    SpellTheWord,
    ConnectionSortingCups,
    ConnectionWithoutSortingCups
  ];

  static bool isPhonetics({required Type chapter}) {
    return listOfChapterOfPhonetics.contains(chapter);
  }

  static List<Type> listOfChapterOfArabic = [RedPhonetics];
  static bool isArabic({required Type chapter}) {
    return listOfChapterOfArabic.contains(chapter);
  }

  static getGameDataType(
      {required String subLetter,
      required String subGame,
      required String unitName,
      required int audioFlag}) {
    if (BasicOfGame.isConnectGame(game: subGame.toLowerCase()) == true) {
      if (subGame.toLowerCase() == GameTypes.sortingCups.text()) {
        return ConnectionSortingCups(mineGameData: SortingCupsGame());
      } else if (subGame.toLowerCase() == GameTypes.spelling.text()) {
        return SpellTheWord(mineGameData: SpellingGame());
      } else {
        return ConnectionWithoutSortingCups(
            mineGameData: BasicOfGame.getTheGameType(
                gameType: subGame.toLowerCase(), audioFlag: audioFlag));
      }
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.s.text()) {
      return SPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.a.text()) {
      return APhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.f.text()) {
      return FPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.m.text()) {
      return MPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.t.text()) {
      return TPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.c.text()) {
      return CPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.r.text()) {
      return RPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.i.text()) {
      return IPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.p.text()) {
      return PPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.h.text()) {
      return HPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.j.text()) {
      return JPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.u.text()) {
      return UPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.l.text()) {
      return LPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.b.text()) {
      return BPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.o.text()) {
      return OPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.g.text()) {
      return GPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.d.text()) {
      return DPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.n.text()) {
      return NPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.w.text()) {
      return WPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (subLetter.toLowerCase() == MainDataOfChaptersTypes.e.text()) {
      return EPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    } else if (unitName.toLowerCase() ==
        MainDataOfChaptersTypes.redUnit.text()) {
      return RedPhonetics(
          mineGameData: BasicOfGame.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
    print(
        '${(unitName.toLowerCase() == MainDataOfChaptersTypes.redUnit.text())}');
    return null;
  }
}
