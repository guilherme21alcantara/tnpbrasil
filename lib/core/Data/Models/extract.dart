import 'package:json_annotation/json_annotation.dart';
part 'extract.g.dart';

@JsonSerializable()
class extract {
  List<Data>? data;

  extract({this.data});

  extract.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? data;
  String? valor;
  String? historico;
  String? operacao;
  int? cod;

  Data({this.data, this.valor, this.historico, this.operacao, this.cod});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    valor = json['valor'];
    historico = json['historico'];
    operacao = json['operacao'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['valor'] = valor;
    data['historico'] = historico;
    data['operacao'] = operacao;
    data['cod'] = cod;
    return data;
  }
}
