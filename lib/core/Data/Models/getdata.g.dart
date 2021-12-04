// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

getdata _$getdataFromJson(Map<String, dynamic> json) => getdata(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$getdataToJson(getdata instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
