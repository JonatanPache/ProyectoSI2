import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';

class SegurosController{
  BuildContext? context;
  Function? refresh;
  AuthProvider userProv= new AuthProvider();
  User? cliente;
  SharedPref _sharedPref=new SharedPref();
  Future init(BuildContext context, Function refresh) async{
    this.context=context;
    this.refresh=refresh;
    userProv.init();
    cliente=User.fromJson(await _sharedPref.read('cliente'));
    print('antes de obtener polizas');
    print(cliente!.toJson());
    refresh();
  }
}