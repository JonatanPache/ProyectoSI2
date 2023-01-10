import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/api/api_services.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';
class CustomController{
  BuildContext? context;
  Function? refresh;
  SharedPref sharedPref = new SharedPref();
  User? user;
  ApiService? _apiService;


  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    if( await User.fromJson(await sharedPref.read('cliente'))==null){
      this.user = await User.fromJson(await sharedPref.read('empleado'));
      refresh();
    }else{
      this.user = await User.fromJson(await sharedPref.read('cliente'));
      refresh();
    }
    print('custom');
    print(user.toString()!);
    this._apiService=new ApiService(user!.remember_token);
    refresh();
  }
}