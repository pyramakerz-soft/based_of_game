import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TestGameFinalModel extends Equatable {
  final int? id;
  final int? programId;
  final int? mistakeCount;
  final dynamic status;
  final int? testId;
  final int? lessonNum;
  final String? name;
  final String? testName;
  final String? programName;
  final String? chapterName;
  final String? teacherName;
  final dynamic type;
  final String? formattedDueDate;
  final String? daysLeft;
  final String? duration;
  final String? createdAt;
  final num? score;
  final num? totalScore;
  final String? updatedAt;

  const TestGameFinalModel(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.duration,
      this.mistakeCount,
      this.programId,
      this.programName,
      this.chapterName,
      this.status,
      this.testName,
      this.daysLeft,
      this.lessonNum,
      this.score,
      this.totalScore,
      this.formattedDueDate,
      this.teacherName,
      this.testId,
      this.type});

  factory TestGameFinalModel.fromJson(Map<String, dynamic> json) {
    return _$TestGameFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TestGameFinalModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        duration,
        mistakeCount,
        programId,
        status,
        testId,
        totalScore,
        score,
        testName,
        teacherName,
        type,
        formattedDueDate,
        daysLeft
      ];
}
