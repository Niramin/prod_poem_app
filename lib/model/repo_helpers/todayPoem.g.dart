// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todayPoem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

todayInfo _$todayInfoFromJson(Map<String, dynamic> json) => todayInfo(
      json['date'] as String? ?? '0000',
      json['poem_id'] as String,
    );

Map<String, dynamic> _$todayInfoToJson(todayInfo instance) => <String, dynamic>{
      'date': instance.date,
      'poem_id': instance.poem_id,
    };
