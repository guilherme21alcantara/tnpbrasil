
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'categoriacity.g.dart';

@JsonSerializable()


class categoriacity {
  List<Data> ? data;

  categoriacity({this.data});

  categoriacity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int ? cod;
  String ?nome;
  int ?desconto;
  String ?uf;
  String ?cidade;
  String ?descontoform;
  String ?imgblob;
  String  ?url;
  String ?strcompleta;

  Data(
      {this.cod,
      this.nome,
      this.desconto,
      this.uf,
      this.cidade,
      this.descontoform,
      this.imgblob,
      this.url,
      this.strcompleta});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = cod;
    data['nome'] = nome;
    data['desconto'] = desconto;
    data['uf'] = uf;
    data['cidade'] = cidade;
    data['descontoform'] = descontoform;
    data['imgblob'] = imgblob;
    data['url'] = url;
    data['strcompleta'] = strcompleta;
    return data;
  }
}