// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

estate _$estateFromJson(Map<String, dynamic> json) => estate(
      id: json['id'] as int?,
      nome: json['nome'] as String?,
      uf: json['uf'] as String?,
    );

Map<String, dynamic> _$estateToJson(estate instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'uf': instance.uf,
    };
