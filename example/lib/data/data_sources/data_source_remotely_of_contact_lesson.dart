import 'package:based_of_eng_game/based_of_eng_game.dart';
import '../../apis_connections/api_connection.dart';
import '../../connection.dart';

abstract class DataSourceRemotelyOfContactLesson {
  Future<List<GameFinalModel>> getContactLessonDataRemotely(
      {required int lessonId, required int gameId});
  Future<List<GameFinalModel>> getGameById({required int gameId});
}

class DataSourceRemotelyOfContactLessonImpl
    implements DataSourceRemotelyOfContactLesson {
  final MainApiConnection dio;

  DataSourceRemotelyOfContactLessonImpl({required this.dio});

  @override
  Future<List<GameFinalModel>> getContactLessonDataRemotely(
      {required int lessonId, required int gameId}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getGameById}',
        queryParameters: {'lesson_id': lessonId, 'game_id': gameId});
    if (dio.validResponse(response)) {
      final List<GameFinalModel> l = [];
      response.data['data']['games']
          .forEach((e) => l.add(GameFinalModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future<List<GameFinalModel>> getGameById({required int gameId}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getGameById}',
        queryParameters: {'game_id': gameId});
    if (dio.validResponse(response)) {
      final List<GameFinalModel> l = [];
      response.data['data']['games']
          .forEach((e) => l.add(GameFinalModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }
}
