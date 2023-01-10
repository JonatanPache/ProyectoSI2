import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/api/api_services.dart';
import 'package:seguro_motors_final/src/models/response_api.dart';
import 'package:seguro_motors_final/src/models/solicitud_siniestro.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/utils/my_snakbar.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';

class SoliSiniestroController{
  BuildContext? context;
  Function? refresh;
  SharedPref sharedPref = new SharedPref();
  User? user;
  List<SolicitudSiniestro> list=[];
  ApiService? _apiService;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    this.user = User.fromJson(await sharedPref.read('cliente'));
    this._apiService=new ApiService(user!.remember_token);
    await getListaSolicitudesNoConfirm();
    refresh();
  }

  Future<void> getListaSolicitudesNoConfirm() async {
    ResponseApi response = await _apiService!.getSolicitudesNoConfirm(this.user!.id);
    print(response);
    if (response.success) {
      MySnackbar.show(context!, response.message);
      var data=response.data;
      print('data de response');
      print(data);
      for(var i = 0; i< data.length; i++) {
        SolicitudSiniestro sol=SolicitudSiniestro.fromJson(data[i]);
        this.list.add(sol);
      }
      print(this.list);
    }else{
      MySnackbar.show(context!, response.message);
    }
  }

}