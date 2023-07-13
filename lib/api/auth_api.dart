import 'package:bootcamp_starter/models/models/register_user.dart';
import 'package:bootcamp_starter/models/r_user.dart';
import 'package:bootcamp_starter/models/register_user.dart';
import '../prefs/shared_pref_controller.dart';
import 'api_helper.dart';

class AuthApi {
  final ApiBaseHelper _helper = ApiBaseHelper();


  Future<void> login({ required String email , required String password }) async {
    final response = await _helper.post("/login", {
      'email' : email ,
      'password': password
    },{});
    if( Registered_user.fromJson(response).token != null) {
      String name = Registered_user.fromJson(response).user!.name!;
      String email = Registered_user.fromJson(response).user!.email;
      String createdAt = Registered_user.fromJson(response).user!.createdAt;
      String updatedAt = Registered_user.fromJson(response).user!.updatedAt;
      String token = Registered_user.fromJson(response).token!;
      int id = Registered_user.fromJson(response).user!.id;
      R_Users user = R_Users(name,email,updatedAt,createdAt,id);
      Registered_user registered_user = Registered_user(user: user , token: token);
      SharedPreController().save_user(user: registered_user);

    }

  }

  Future<void> register({required String name , required String email , required String password}) async {
    final response = await _helper.post("/register", {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password
    }, {});
    if (Registered_user.fromJson(response).token != null) {
      String name = Registered_user.fromJson(response).user!.name;
      String email = Registered_user.fromJson(response).user!.email;
      String createdAt = Registered_user.fromJson(response).user!.createdAt;
      String updatedAt = Registered_user.fromJson(response).user!.updatedAt;
      String token = Registered_user.fromJson(response).token!;
      int id = Registered_user.fromJson(response).user!.id;
      R_Users user = R_Users(name,email,updatedAt,createdAt,id);
      Registered_user registered_user = Registered_user(user: user , token: token);
      SharedPreController().save_user(user: registered_user);
    }
  }
}