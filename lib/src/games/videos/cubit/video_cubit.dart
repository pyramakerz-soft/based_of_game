import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../src_model/export_models.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoInitial> {
  VideoCubit({required GameFinalModel gameData})
      : super(VideoInitial(gameData: gameData));
}
