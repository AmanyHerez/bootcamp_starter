import 'package:bootcamp_starter/models/r_user.dart';

import 'models/r_user.dart';

class Registered_user {
  String? message;
  late R_Users user;
  String? token;

  Registered_user({this.message, required this.user , this.token});
  Registered_user.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user']  ;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}