// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoriacity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

categoriacity _$categoriacityFromJson(Map<String, dynamic> json) =>
    categoriacity(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$categoriacityToJson(categoriacity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
