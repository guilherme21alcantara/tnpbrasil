
import 'package:json_annotation/json_annotation.dart';
part 'saldo.g.dart';

@JsonSerializable()
class saldo {
  Data ?data;

  saldo({this.data});

  saldo.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int ?cliCod;
  String ?cliNome;
  String ?cliCpf;
  String ?cliEmail;
  String ?cliSaldo;
  String ?cliSaldoform;
  String ?cliCidade;

  Data(
      {this.cliCod,
      this.cliNome,
      this.cliCpf,
      this.cliEmail,
      this.cliSaldo,
      this.cliSaldoform,
      this.cliCidade});

  Data.fromJson(Map<String, dynamic> json) {
    cliCod = json['cli_cod'];
    cliNome = json['cli_nome'];
    cliCpf = json['cli_cpf'];
    cliEmail = json['cli_email'];
    cliSaldo = json['cli_saldo'];
    cliSaldoform = json['cli_saldoform'];
    cliCidade = json['cli_cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cli_cod'] = cliCod;
    data['cli_nome'] = cliNome;
    data['cli_cpf'] = cliCpf;
    data['cli_email'] = cliEmail;
    data['cli_saldo'] = cliSaldo;
    data['cli_saldoform'] = cliSaldoform;
    data['cli_cidade'] = cliCidade;
    return data;
  }
}
