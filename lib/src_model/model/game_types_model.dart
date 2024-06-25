import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game_types_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GameTypesFinalModel extends Equatable {
  final int? id;
  final int? gameId;
  final String? letter;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const GameTypesFinalModel(
      {this.id,
      this.name,
      this.gameId,
      this.letter,
      this.createdAt,
      this.updatedAt});

  factory GameTypesFinalModel.fromJson(Map<String, dynamic> json) {
    return _$GameTypesFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameTypesFinalModelToJson(this);

  @override
  List<Object?> get props => [id, name, gameId, letter, createdAt, updatedAt];
}
