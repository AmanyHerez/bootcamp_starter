import 'package:bootcamp_starter/models/r_user.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';

import 'api_helper.dart';

class UsersApi {
  final ApiBaseHelper _helper = ApiBaseHelper();


  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name)!;

  Future<void> update_location({ required int id, required String lat , required String long}) async {
    final response = await _helper.put("/update/$id", {
      'lat':lat,
      'long':long
    },
        {
      'Authorization': 'Bearer $userToken',
    });
  }

  Future<void> update_fcm({ required int id ,required String fcm}) async {
    final response = await _helper.put("/fcm/$id", {
      'fcm':fcm,
    },
        {
          'Authorization': 'Bearer $userToken',
        });
    // print(R_User.fromJson(response).fcm);

  }
}