import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:games_models/games_models.dart';
import '../../domain/repositories/repositories_contact_lesson.dart';
import '../../error/failures.dart';
import '../../network/network_info.dart';
import '../data_sources/data_source_remotely_of_contact_lesson.dart';

class ContactLessonRepositoryImpl implements ProgramContactLessonRepository {
  final DataSourceRemotelyOfContactLesson remoteDataSource;

  final NetworkInfo networkInfo;

  ContactLessonRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<GameModel>>> lessonContactDataRepository(
      {required int lessonId, required int gameId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getContactLessonDataRemotely(
            lessonId: lessonId, gameId: gameId);
        // final res = await localRemoteDataSource.getContactLessonDataRemotely(programId: programId);
        log('res:$res');
        return Right(res);
      } catch (e, s) {
        log('error:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<GameModel>>> gameById(
      {required int gameId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getGameById(gameId: gameId);
        // final res = await localRemoteDataSource.getContactLessonDataRemotely(programId: programId);
        log('res:$res');
        return Right(res);
      } catch (e, s) {
        log('error:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
