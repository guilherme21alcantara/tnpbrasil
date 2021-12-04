
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'commerce.g.dart';

@JsonSerializable()

class commerce {
  String ?status;
  List<Data> ?data;

  commerce({this.status, this.data});

  commerce.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int ?cod;
  String ?nome;
  int ?desconto;
  String ?uf;
  String ?cidade;
  String ?descontoform;
  String ?imgblob;
  String ?url;
  String ?strcompleta;
  String ?telefone;

  Data(
      {this.cod,
      this.nome,
      this.desconto,
      this.uf,
      this.cidade,
      this.descontoform,
      this.imgblob,
      this.url,
      this.strcompleta,
      this.telefone});

  Data.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    nome = json['nome'];
    desconto = json['desconto'];
    uf = json['uf'];
    cidade = json['cidade'];
    descontoform = json['descontoform'];
    imgblob = json['imgblob'];
    url = json['url'];
    strcompleta = json['strcompleta'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['nome'] = this.nome;
    data['desconto'] = this.desconto;
    data['uf'] = this.uf;
    data['cidade'] = this.cidade;
    data['descontoform'] = this.descontoform;
    data['imgblob'] = this.imgblob;
    data['url'] = this.url;
    data['strcompleta'] = this.strcompleta;
    data['telefone'] = this.telefone;
    return data;
  }
}