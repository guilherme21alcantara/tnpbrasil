import 'package:json_annotation/json_annotation.dart';

part 'pix.g.dart';

@JsonSerializable()
class pix {
  String ?status;
  String ?chave;

  pix({this.status, this.chave});

  pix.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    chave = json['chave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['chave'] = chave;
    return data;
  }
}