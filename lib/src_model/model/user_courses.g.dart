// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_courses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCourseGameFinalModel _$UserCourseGameFinalModelFromJson(
        Map<String, dynamic> json) =>
    UserCourseGameFinalModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      programId: (json['program_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      name: json['name'] as String?,
      updatedAt: json['updated_at'] as String?,
      program: json['program'] == null
          ? null
          : ProgramGameFinalModel.fromJson(
              json['program'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCourseGameFinalModelToJson(
        UserCourseGameFinalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'program_id': instance.programId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'program': instance.program?.toJson(),
      'name': instance.name,
    };
