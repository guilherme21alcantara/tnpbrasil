// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commerce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

commerce _$commerceFromJson(Map<String, dynamic> json) => commerce(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$commerceToJson(commerce instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
