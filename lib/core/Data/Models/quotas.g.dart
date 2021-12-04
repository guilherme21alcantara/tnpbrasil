// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

quotas _$quotasFromJson(Map<String, dynamic> json) => quotas(
      status: json['status'] as String?,
      currentSupply: json['currentSupply'] as String?,
      userQuotas: json['userQuotas'] as int?,
    );

Map<String, dynamic> _$quotasToJson(quotas instance) => <String, dynamic>{
      'status': instance.status,
      'currentSupply': instance.currentSupply,
      'userQuotas': instance.userQuotas,
    };
