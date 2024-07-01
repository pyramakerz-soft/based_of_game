import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'course_model.dart';
part 'program_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProgramGameFinalModel extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int? schoolId;
  final int? courseId;
  final int? stageId;
  final String? createdAt;
  final String? updatedAt;
  final CourseGameFinalModel? course;
  // final List<TestGameFinalModel>? studentTests;

  const ProgramGameFinalModel(
      {this.id,
      this.name,
      this.schoolId,
      this.courseId,
      this.stageId,
      this.createdAt,
      this.updatedAt,
      this.image,
      // this.studentTests,
      this.course});
  factory ProgramGameFinalModel.fromJson(Map<String, dynamic> json) {
    return _$ProgramGameFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProgramGameFinalModelToJson(this);

  @override
  List<Object?> get props =>
      [id, name, schoolId, courseId, stageId, updatedAt, image];
}
