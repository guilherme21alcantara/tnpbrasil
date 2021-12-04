import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'compra.g.dart';

@JsonSerializable()
class compra {
  String ?status;
  String ?nomeComercio;
  String ? cnpj;
  String ?valorCompra;
  int ?date;

  compra({this.status, this.nomeComercio, this.cnpj,this.valorCompra, this.date});

  compra.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nomeComercio = json['nome_comercio'];
    cnpj = json['cnpj'];
    valorCompra = json['valor_compra'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> date = new Map<String, dynamic>();
    date['status'] = status;
    date['nome_comercio'] = nomeComercio;
    date['cnpj']= cnpj;
    date['valor_compra'] = valorCompra;
    date['data'] = date;
    return date;
  }
}