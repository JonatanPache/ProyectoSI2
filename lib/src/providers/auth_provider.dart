import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/api/api_services.dart';
import 'package:seguro_motors_final/src/models/response_api.dart';
import 'package:seguro_motors_final/src/models/solicitud_siniestro.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  late String token;
  late ApiService apiService;

  AuthProvider(){
    init();
  }
  Future<void> init() async{
    this.token=await getToken();
    if(this.token.isNotEmpty){
      this.isAuthenticated=true;
    }else{
      this.isAuthenticated=false;
    }
    this.apiService = new ApiService(this.token);
    notifyListeners();
  }
/*
  Future<void> register(String name, String email, String password,
      String passwordConfirm, String device_name) async {
    this.token = await apiService.register(
        name, email, password, passwordConfirm, device_name);
    setToken(this.token);
    this.isAuthenticated = true;
    notifyListeners();
  }*/

  Future<ResponseApi> login(String email, String password,String device_name) async {
    ResponseApi res = await apiService.login(email, password,device_name);
    User user = User.fromJson(res.data);
    //guardamos el token recibido de api laravel
    print(user.remember_token);
    this.token =user.remember_token;
    this.isAuthenticated = true;
    //guardamos el token en shared_pref
    setToken(this.token);
    notifyListeners();
    return res;
  }

  Future<void> updateNotificationToken(String? tokenNotification) async {
    await apiService.updateNotificationToken(tokenNotification);
  }

  Future<void> logout() async {
    this.token = '';
    setToken(this.token);
    this.isAuthenticated = false;

    notifyListeners();
  }

  Future<void> setToken(token ) async {
    final pre= await SharedPreferences.getInstance();
    pre.setString('token', token);
  }

  Future<String> getToken() async {
    final pre= await SharedPreferences.getInstance();
    return pre.getString('token')??'';
  }

  Future<ResponseApi> createSolicitudSiniestro(SolicitudSiniestro solicitud) async{
    ResponseApi res = await apiService.createSiniestro(solicitud);
    print('create solicitud authProvider'+res.toString());
    return res;
  }
}
