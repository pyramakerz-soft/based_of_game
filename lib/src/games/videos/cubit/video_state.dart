part of 'video_cubit.dart';

class VideoInitial extends Equatable {
  final GameFinalModel gameData;
  const VideoInitial({required this.gameData});
  VideoInitial copyWith({GameFinalModel? gameData}) {
    return VideoInitial(gameData: gameData ?? this.gameData);
  }

  @override
  List<Object?> get props => [gameData];
}
