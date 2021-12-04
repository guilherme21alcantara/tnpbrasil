// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saldo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

saldo _$saldoFromJson(Map<String, dynamic> json) => saldo(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$saldoToJson(saldo instance) => <String, dynamic>{
      'data': instance.data,
    };
