import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sub_chapter_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SubChapterGameFinalModel extends Equatable {
  final int? id;
  final int? number;
  final int? warmupId;
  final int? programId;
  final int? unitId;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const SubChapterGameFinalModel(
      {this.id,
      this.name,
      this.number,
      this.unitId,
      this.warmupId,
      this.createdAt,
      this.updatedAt,
      this.programId});

  factory SubChapterGameFinalModel.fromJson(Map<String, dynamic> json) {
    return _$SubChapterGameFinalModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubChapterGameFinalModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        createdAt,
        number,
        warmupId,
        unitId,
        createdAt,
        updatedAt,
        programId
      ];
}
