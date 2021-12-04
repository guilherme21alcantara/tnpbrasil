
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'autenticar.g.dart';

@JsonSerializable()
class autenticar {
  String ?token;
  int ?expiresIn;
  int ?userId;
  bool ?senhaNumerica;

  autenticar({this.token, this.expiresIn, this.userId, this.senhaNumerica});

  autenticar.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresIn = json['expires_in'];
    userId = json['user_id'];
    senhaNumerica = json['senha_numerica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['expires_in'] = expiresIn;
    data['user_id'] = userId;
    data['senha_numerica'] = senhaNumerica;
    return data;
  }
}