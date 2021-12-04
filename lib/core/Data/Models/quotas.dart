import 'package:json_annotation/json_annotation.dart';
part 'quotas.g.dart';

@JsonSerializable()

class quotas {
  String ?status;
  String ?currentSupply;
  int ?userQuotas;

  quotas({this.status, this.currentSupply, this.userQuotas});

  quotas.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    currentSupply = json['current_supply'];
    userQuotas = json['user_quotas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['current_supply'] = currentSupply;
    data['user_quotas'] = userQuotas;
    return data;
  }
}