import 'package:dartz/dartz.dart';
import 'package:games_models/games_models.dart';
import '../../error/failures.dart';

abstract class ProgramContactLessonRepository {
  Future<Either<Failure, List<GameModel>>> lessonContactDataRepository(
      {required int lessonId, required int gameId});
  Future<Either<Failure, List<GameModel>>> gameById({required int gameId});
}
