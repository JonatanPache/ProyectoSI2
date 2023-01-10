import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';
class DashboardController{
  BuildContext? context;
  Function? refresh;
  SharedPref sharedPref = new SharedPref();
  User? user;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    this.user = User.fromJson(await sharedPref.read('cliente'));
    //if(this.user == null){
      //this.user = User.fromJson(await sharedPref.read('empleado'));
    //}
    print(this.user.toString());
    refresh();
  }
}