// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameTypesFinalModel _$GameTypesFinalModelFromJson(Map<String, dynamic> json) =>
    GameTypesFinalModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      gameId: (json['game_id'] as num?)?.toInt(),
      letter: json['letter'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$GameTypesFinalModelToJson(
        GameTypesFinalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'game_id': instance.gameId,
      'letter': instance.letter,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
