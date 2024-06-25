import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_images_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameImagesGameFinalModel extends Equatable {
  final int? id;
  final int? gameId;
  final int? gameLetterId;
  final int? index;
  final String? image;
  final String? word;
  final int? correct;
  final String? createdAt;
  final String? updatedAt;

  const GameImagesGameFinalModel(
      {this.correct,
      this.word,
      this.id,
      this.gameId,
      this.gameLetterId,
      this.index,
      this.image,
      this.createdAt,
      this.updatedAt});

  factory GameImagesGameFinalModel.fromJson(Map<String, dynamic> json) {
    return _$GameImagesGameFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameImagesGameFinalModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        gameId,
        correct,
        word,
        createdAt,
        updatedAt,
        gameLetterId,
        index,
        image
      ];
}
