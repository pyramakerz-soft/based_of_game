import 'package:dartz/dartz.dart';
import 'package:games_models/games_models.dart';
import '../../error/failures.dart';
import '../repositories/repositories_contact_lesson.dart';

class ContactLessonUseCases {
  final ProgramContactLessonRepository repository;

  ContactLessonUseCases(this.repository);

  Future<Either<Failure, List<GameModel>>> call(
      {required int lessonId, required int gameId}) async {
    return await repository.lessonContactDataRepository(
        lessonId: lessonId, gameId: gameId);
  }
}
