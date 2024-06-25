import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'game_model.dart';
import 'sub_chapter_model.dart';
import 'user_courses.dart';
part 'lesson_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LessonGameFinalModel extends Equatable {
  final int? id;
  final int? number;
  final int? warmupId;
  final int? stars;
  final String? type;
  final int? unitId;
  final String? name;
  final String? createdAt;
  final String? updatedAt;
  final SubChapterGameFinalModel? chapter;
  final List<GameFinalModel>? games;
  final UserCourseGameFinalModel? unit;
  const LessonGameFinalModel(
      {this.id,
      this.name,
      this.stars,
      this.number,
      this.unitId,
      this.warmupId,
      this.createdAt,
      this.updatedAt,
      this.chapter,
      this.type,
      this.games,
      this.unit});

  factory LessonGameFinalModel.fromJson(Map<String, dynamic> json) {
    return _$LessonGameFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LessonGameFinalModelToJson(this);

  @override
  List<Object?> get props => [
        unit,
        id,
        name,
        createdAt,
        number,
        warmupId,
        unitId,
        createdAt,
        updatedAt,
        chapter,
        stars,
        type,
        games
      ];
}
