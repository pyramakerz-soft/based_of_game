import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_models/games_models.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoInitial> {
  VideoCubit({required GameModel gameData})
      : super(VideoInitial(gameData: gameData));
}
