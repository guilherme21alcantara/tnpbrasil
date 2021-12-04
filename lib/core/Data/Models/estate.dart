import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'estate.g.dart';
@JsonSerializable()
class estate {
  int ?id;
  String ?nome;
  String ?uf;

  estate({this.id, this.nome, this.uf});

  estate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['uf'] = uf;
    return data;
  }
}