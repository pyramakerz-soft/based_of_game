import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'program_model.dart';
part 'user_courses.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserCourseGameFinalModel extends Equatable {
  final int? id;
  final int? userId;
  final int? programId;
  final String? createdAt;
  final String? updatedAt;
  final ProgramGameFinalModel? program;
  final String? name;

  const UserCourseGameFinalModel(
      {this.id,
      this.userId,
      this.programId,
      this.createdAt,
      this.name,
      this.updatedAt,
      this.program});

  factory UserCourseGameFinalModel.fromJson(Map<String, dynamic> json) {
    return _$UserCourseGameFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserCourseGameFinalModelToJson(this);

  @override
  List<Object?> get props =>
      [id, userId, programId, program, createdAt, updatedAt, name];
}
