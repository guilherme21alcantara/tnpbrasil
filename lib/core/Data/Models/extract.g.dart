// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

extract _$extractFromJson(Map<String, dynamic> json) => extract(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$extractToJson(extract instance) => <String, dynamic>{
      'data': instance.data,
    };
