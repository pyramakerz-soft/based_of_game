import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'course_model.g.dart';

@immutable
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CourseGameFinalModel extends Equatable {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const CourseGameFinalModel(
      {this.id, this.name, this.createdAt, this.updatedAt});

  factory CourseGameFinalModel.fromJson(Map<String, dynamic> json) {
    return _$CourseGameFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CourseGameFinalModelToJson(this);

  @override
  List<Object?> get props => [id, name, createdAt];
}
