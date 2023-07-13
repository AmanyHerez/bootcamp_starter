

import 'package:bootcamp_starter/models/r_user.dart';

class Registered_userss {
  String? message;
  R_Users? user;
  String? token;

  Registered_userss({this.message, this.user, this.token});

  Registered_userss.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new R_Users.fromJson(json['user']) : null;
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

