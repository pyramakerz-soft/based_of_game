// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonGameFinalModel _$LessonGameFinalModelFromJson(
        Map<String, dynamic> json) =>
    LessonGameFinalModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      stars: (json['stars'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      warmupId: (json['warmup_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      chapter: json['chapter'] == null
          ? null
          : SubChapterGameFinalModel.fromJson(
              json['chapter'] as Map<String, dynamic>),
      type: json['type'] as String?,
      games: (json['games'] as List<dynamic>?)
          ?.map((e) => GameFinalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['unit'] == null
          ? null
          : UserCourseGameFinalModel.fromJson(
              json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LessonGameFinalModelToJson(
        LessonGameFinalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'warmup_id': instance.warmupId,
      'stars': instance.stars,
      'type': instance.type,
      'unit_id': instance.unitId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'chapter': instance.chapter?.toJson(),
      'games': instance.games?.map((e) => e.toJson()).toList(),
      'unit': instance.unit?.toJson(),
    };
