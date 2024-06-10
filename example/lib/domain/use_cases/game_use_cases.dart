import 'package:dartz/dartz.dart';
import 'package:games_models/games_models.dart';
import '../../error/failures.dart';
import '../repositories/repositories_contact_lesson.dart';

class GetGameUseCases {
  final ProgramContactLessonRepository repository;

  GetGameUseCases(this.repository);

  Future<Either<Failure, List<GameModel>>> call({required int gameId}) async {
    return await repository.gameById(gameId: gameId);
  }
}
