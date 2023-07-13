import 'dart:io';

import 'package:bootcamp_starter/api/api_helper.dart';
import 'package:bootcamp_starter/api/api_message.dart';
import 'package:bootcamp_starter/api/users_api.dart';
import 'package:bootcamp_starter/features/search/models/search_model.dart';
import 'package:bootcamp_starter/models/Users.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class ActiveSharing {

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<ApiMessage> setActive (String type)async{
    final response =await _helper.post('/activeShare/2', {
      "type": type
    }, {
      HttpHeaders.authorizationHeader: SharedPreController().getValueFor(key: Prefkeys.token.name)??'',
      HttpHeaders.acceptHeader:'application/json'
    });
    if(response['message']=='unauthenticated'){
      return ApiMessage(message: response['message'], success: false);
    }
    return ApiMessage(message: 'Updated successfully', success: true);
  }


  Future<ApiMessage> removeActive (String token)async{
    final response =await _helper.post('/activeShare/5', {}, {
      HttpHeaders.authorizationHeader: SharedPreController().getValueFor(key: Prefkeys.token.name)??'',
      HttpHeaders.acceptHeader:'application/json'
    });
    if(response['message']=='unauthenticated'){
      return ApiMessage(message: response['message'], success: false);
    }
    return ApiMessage(message: 'Updated successfully', success: true);
  }

  Future<List<Users>> nearestSender (String token)async{
    // UsersApi().update_fcm(fcm: user.fcm);
    // UsersApi().update_location(lat: user.latitude.toString(), long: user.longitude.toString());
    final response =await _helper.post('/activeShare/nearest/1', {}, {
      HttpHeaders.authorizationHeader: SharedPreController().getValueFor(key: Prefkeys.token.name)??'',
      HttpHeaders.acceptHeader:'application/json'
    });
    if(response['message']=='unauthenticated'){
      // return ApiMessage(message: response['message'], success: false);
      return [];
    }
    // return ApiMessage(message: 'Updated successfully', success: true);
    return <Users>[];
  }
}