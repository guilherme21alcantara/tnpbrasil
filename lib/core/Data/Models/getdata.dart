
import 'package:json_annotation/json_annotation.dart';

part 'getdata.g.dart';

@JsonSerializable()
class getdata {
  String ?status;
  Data ?data;

  getdata({this.status, this.data});

  getdata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int ?id;
  String ?name;
  String ?username;
  String ?email;
  String ?cpf;
  String ?aniversario;
  String ?rg;
  String ?rua;
  String ?complemento;
  String ?numero;
  String ?bairro;
  String ?cidade;
  String ?estado;
  String ?cep;
  String ?saldo;
  String ?pendente;
  String ?saldoDis;
  String ?saldoQuotas;
  String ?saldoEco;
  String ?saldoCashBack;
  String ?userImage;
  String ?celular;
  String ?leftOverPri;
  String ?exBalFirDon;
  String ?sumRenda;
  String ?cashbackCompartilhado;
  int ?profileComplet;
  int ?quota;
  String ?updatedAt;
  String ?createdAt;
  String ?exMonDonBal;
  int ?pfPj;
  int ?permissao;
  String ?isExecutive;
  int ?idCidade;
  int ?idEstado;
  int ?estAutoAnte;
  int ?isComercio;
  String ?token;
  String ?tokenExpirationTime;
  bool ?recorrenciaCartao;
  bool ?senhaNumerica;

  Data(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.cpf,
      this.aniversario,
      this.rg,
      this.rua,
      this.complemento,
      this.numero,
      this.bairro,
      this.cidade,
      this.estado,
      this.cep,
      this.saldo,
      this.pendente,
      this.saldoDis,
      this.saldoQuotas,
      this.saldoEco,
      this.saldoCashBack,
      this.userImage,
      this.celular,
      this.leftOverPri,
      this.exBalFirDon,
      this.sumRenda,
      this.cashbackCompartilhado,
      this.profileComplet,
      this.quota,
      this.updatedAt,
      this.createdAt,
      this.exMonDonBal,
      this.pfPj,
      this.permissao,
      this.isExecutive,
      this.idCidade,
      this.idEstado,
      this.estAutoAnte,
      this.isComercio,
      this.token,
      this.tokenExpirationTime,
      this.recorrenciaCartao,
      this.senhaNumerica});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    cpf = json['cpf'];
    aniversario = json['aniversario'];
    rg = json['rg'];
    rua = json['rua'];
    complemento = json['complemento'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    cep = json['cep'];
    saldo = json['saldo'];
    pendente = json['pendente'];
    saldoDis = json['saldoDis'];
    saldoQuotas = json['saldoQuotas'];
    saldoEco = json['saldoEco'];
    saldoCashBack = json['saldoCashBack'];
    userImage = json['userImage'];
    celular = json['celular'];
    leftOverPri = json['leftOverPri'];
    exBalFirDon = json['exBalFirDon'];
    sumRenda = json['sumRenda'];
    cashbackCompartilhado = json['cashbackCompartilhado'];
    profileComplet = json['profileComplet'];
    quota = json['quota'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    exMonDonBal = json['exMonDonBal'];
    pfPj = json['pfPj'];
    permissao = json['permissao'];
    isExecutive = json['is_executive'];
    idCidade = json['id_cidade'];
    idEstado = json['id_estado'];
    estAutoAnte = json['est_auto_ante'];
    isComercio = json['isComercio'];
    token = json['token'];
    tokenExpirationTime = json['token_expiration_time'];
    recorrenciaCartao = json['recorrencia_cartao'];
    senhaNumerica = json['senha_numerica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    data['aniversario'] = this.aniversario;
    data['rg'] = this.rg;
    data['rua'] = this.rua;
    data['complemento'] = this.complemento;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['cep'] = this.cep;
    data['saldo'] = this.saldo;
    data['pendente'] = this.pendente;
    data['saldoDis'] = this.saldoDis;
    data['saldoQuotas'] = this.saldoQuotas;
    data['saldoEco'] = this.saldoEco;
    data['saldoCashBack'] = this.saldoCashBack;
    data['userImage'] = this.userImage;
    data['celular'] = this.celular;
    data['leftOverPri'] = this.leftOverPri;
    data['exBalFirDon'] = this.exBalFirDon;
    data['sumRenda'] = this.sumRenda;
    data['cashbackCompartilhado'] = this.cashbackCompartilhado;
    data['profileComplet'] = this.profileComplet;
    data['quota'] = this.quota;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['exMonDonBal'] = this.exMonDonBal;
    data['pfPj'] = this.pfPj;
    data['permissao'] = this.permissao;
    data['is_executive'] = this.isExecutive;
    data['id_cidade'] = this.idCidade;
    data['id_estado'] = this.idEstado;
    data['est_auto_ante'] = this.estAutoAnte;
    data['isComercio'] = this.isComercio;
    data['token'] = this.token;
    data['token_expiration_time'] = this.tokenExpirationTime;
    data['recorrencia_cartao'] = this.recorrenciaCartao;
    data['senha_numerica'] = this.senhaNumerica;
    return data;
  }
}
