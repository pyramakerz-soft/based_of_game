import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:dartz/dartz.dart';
import '../../error/failures.dart';
import '../repositories/repositories_contact_lesson.dart';

class ContactLessonUseCases {
  final ProgramContactLessonRepository repository;

  ContactLessonUseCases(this.repository);

  Future<Either<Failure, List<GameFinalModel>>> call(
      {required int lessonId, required int gameId}) async {
    return await repository.lessonContactDataRepository(
        lessonId: lessonId, gameId: gameId);
  }
}
