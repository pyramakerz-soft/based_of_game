part of 'video_cubit.dart';

class VideoInitial extends Equatable {
  final GameModel gameData;
  const VideoInitial({required this.gameData});
  VideoInitial copyWith({GameModel? gameData}) {
    return VideoInitial(gameData: gameData ?? this.gameData);
  }

  @override
  List<Object?> get props => [gameData];
}
