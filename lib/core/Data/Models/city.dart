import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'city.g.dart';

@JsonSerializable()


class city { int ?id;
  String ?nome;
  int ? estado;

  city({this.id, this.nome, this.estado});

  city.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['estado'] = estado;
    return data;
  }
}