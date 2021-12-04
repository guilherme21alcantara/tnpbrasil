// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

city _$cityFromJson(Map<String, dynamic> json) => city(
      id: json['id'] as int?,
      nome: json['nome'] as String?,
      estado: json['estado'] as int?,
    );

Map<String, dynamic> _$cityToJson(city instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'estado': instance.estado,
    };
