import 'package:flutter/material.dart';

import '../../games/tracing/widget/letter_m.dart';
import '../../games/tracing/widget/letter_s.dart';
import '../assets_images_phonetics.dart';
import '../game_types/assets_images_arabic.dart';
import 'basic_of_game_data.dart';

enum MainDataOfChaptersTypes {
  s,
  a,
  f,
  m,
  t,
  c,
  i,
  r,
  p,
  h,
  j,
  u,
  l,
  b,
  video,
  o,
  g,
  d,
  w,
  e,
  n,
  k,q,v,x,y,z,
  redUnit,
  shortVowels,
}

extension TypeExtension on MainDataOfChaptersTypes {
  String text() {
    switch (this) {
      case MainDataOfChaptersTypes.a:
        return "a".toLowerCase();
      case MainDataOfChaptersTypes.b:
        return 'b'.toLowerCase();
      case MainDataOfChaptersTypes.f:
        return 'f'.toLowerCase();
      case MainDataOfChaptersTypes.m:
        return 'm'.toLowerCase();
      case MainDataOfChaptersTypes.t:
        return 't'.toLowerCase();
      case MainDataOfChaptersTypes.c:
        return 'c'.toLowerCase();
      case MainDataOfChaptersTypes.i:
        return 'i'.toLowerCase();
      case MainDataOfChaptersTypes.g:
        return 'g'.toLowerCase();
      case MainDataOfChaptersTypes.o:
        return 'o'.toLowerCase();
      case MainDataOfChaptersTypes.j:
        return 'j'.toLowerCase();
      case MainDataOfChaptersTypes.l:
        return 'l'.toLowerCase();
      case MainDataOfChaptersTypes.u:
        return 'u'.toLowerCase();
      case MainDataOfChaptersTypes.h:
        return 'h'.toLowerCase();
      case MainDataOfChaptersTypes.p:
        return 'p'.toLowerCase();
      case MainDataOfChaptersTypes.r:
        return 'r'.toLowerCase();
      case MainDataOfChaptersTypes.s:
        return 's'.toLowerCase();
      case MainDataOfChaptersTypes.d:
        return 'd'.toLowerCase();
      case MainDataOfChaptersTypes.w:
        return 'w'.toLowerCase();
      case MainDataOfChaptersTypes.e:
        return 'e'.toLowerCase();
      case MainDataOfChaptersTypes.n:
        return 'n'.toLowerCase();
      case MainDataOfChaptersTypes.k:
        return 'k'.toLowerCase();
      case MainDataOfChaptersTypes.q:
        return 'q'.toLowerCase();
      case MainDataOfChaptersTypes.v:
        return 'v'.toLowerCase();
      case MainDataOfChaptersTypes.x:
        return 'x'.toLowerCase();
      case MainDataOfChaptersTypes.y:
        return 'y'.toLowerCase();
      case MainDataOfChaptersTypes.z:
        return 'z'.toLowerCase();
      case MainDataOfChaptersTypes.shortVowels:
        return 'Short Vowels'.toLowerCase();
      case MainDataOfChaptersTypes.video:
        return 'video'.toLowerCase();
      case MainDataOfChaptersTypes.redUnit:
        return "المجموعة الحمراء".toLowerCase();
    }
  }
}

abstract class MainDataOfChapters {
  late String basicAvatar;
  late String winAvatar;
  late String idelAvatar;
  late String sadAvatar;
  late String background;
  BasicOfGameData? gameData;
  late Color backGroundOfStarBar;
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)?
      get tracingOfLetter;
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath;
  late int? countOfPartsOfLettersForTracing = 0;
}

class SPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfS;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  SPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 14;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterS(
                colorsOfPaths: colorsOfPaths, points: points);
          };
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return FlipBookPainterLetterS.indexOfPointInside(
                point, size, isFingerPosition);
          };
}

class APhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfA;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };
  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  APhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;
  @override
  int? countOfPartsOfLettersForTracing = 0;
}

class FPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };
  @override
  String background = AppImagesPhonetics.backGroundOfA;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  FPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class MPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfM;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  MPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 16;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterM(colorsOfPaths: colorsOfPaths);
          };

  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}
class KPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfK;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  KPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 16;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterM(colorsOfPaths: colorsOfPaths);
          };

  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}
class QPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfQ;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  QPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 16;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterM(colorsOfPaths: colorsOfPaths);
          };

  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}
class VPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfV;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  VPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 16;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterM(colorsOfPaths: colorsOfPaths);
          };

  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}
class XPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfX;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  XPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 16;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterM(colorsOfPaths: colorsOfPaths);
          };

  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}
class YPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfY;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  YPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 16;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterM(colorsOfPaths: colorsOfPaths);
          };

  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}
class ZPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfZ;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  ZPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 16;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return FlipBookPainterLetterM(colorsOfPaths: colorsOfPaths);
          };

  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}

class TPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfT;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  TPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class CPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfC;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  CPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class RPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfR;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  RPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class IPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfI;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  IPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class PPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfP;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  PPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class HPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfH;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  HPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class JPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfJ;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  JPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class UPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfJ;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  UPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class LPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfL;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  LPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class BPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfB;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  BPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class OPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = Colors.white.withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfO;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  OPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class GPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfG;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  GPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class DPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfD;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  DPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class WPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfW;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  WPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class EPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String background = AppImagesPhonetics.backGroundOfE;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  EPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class NPhonetics implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfN;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  NPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class ShortVowels implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfShortVowels;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  ShortVowels
      ({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing;
}

class ConnectionWithoutSortingCups implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfConnect;

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;
  @override
  String basicAvatar = AppImagesPhonetics.basicBess;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;
  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  ConnectionWithoutSortingCups({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  int? countOfPartsOfLettersForTracing;
}

class ConnectionSortingCups implements MainDataOfChapters {
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesPhonetics.backGroundOfConnect;

  @override
  String basicAvatar = AppImagesPhonetics.basicBess;

  @override
  String sadAvatar = AppImagesPhonetics.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesPhonetics.beeSuccess;

  ConnectionSortingCups({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesPhonetics.beeIdleRiv;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };

  @override
  int? countOfPartsOfLettersForTracing;
}

class RedPhonetics implements MainDataOfChapters {
  final BasicOfGameData mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesArabic.bgOfRedUnit;

  @override
  String basicAvatar = AppImagesArabic.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesArabic.beeFailureRiv;

  @override
  BasicOfGameData? gameData;

  @override
  String winAvatar = AppImagesArabic.beeSuccess;

  RedPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesArabic.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 14;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths, List<Offset> points)
      get tracingOfLetter =>
          (List<Color?>? colorsOfPaths, List<Offset> points) {
            return null;
          };
  @override
  (Path, int)? Function(Offset point, Size size, bool isFingerPosition)?
      get checkTheIndexOfPath =>
          (Offset point, Size size, bool isFingerPosition) {
            return null;
          };
}
