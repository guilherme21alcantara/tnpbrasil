// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

autenticar _$autenticarFromJson(Map<String, dynamic> json) => autenticar(
      token: json['token'] as String?,
      expiresIn: json['expiresIn'] as int?,
      userId: json['userId'] as int?,
      senhaNumerica: json['senhaNumerica'] as bool?,
    );

Map<String, dynamic> _$autenticarToJson(autenticar instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresIn': instance.expiresIn,
      'userId': instance.userId,
      'senhaNumerica': instance.senhaNumerica,
    };
