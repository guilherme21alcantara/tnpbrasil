// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

compra _$compraFromJson(Map<String, dynamic> json) => compra(
      status: json['status'] as String?,
      nomeComercio: json['nomeComercio'] as String?,
      cnpj: json['cnpj'] as String?,
      valorCompra: json['valorCompra'] as String?,
      date: json['date'] as int?,
    );

Map<String, dynamic> _$compraToJson(compra instance) => <String, dynamic>{
      'status': instance.status,
      'nomeComercio': instance.nomeComercio,
      'cnpj': instance.cnpj,
      'valorCompra': instance.valorCompra,
      'date': instance.date,
    };
