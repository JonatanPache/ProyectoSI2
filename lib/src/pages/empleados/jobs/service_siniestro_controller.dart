import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/api/api_services.dart';
import 'package:seguro_motors_final/src/models/response_api.dart';
import 'package:seguro_motors_final/src/models/service_siniestro.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/utils/my_snakbar.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';

class ServiceSiniestroController{
  BuildContext? context;
  Function? refresh;
  SharedPref sharedPref = new SharedPref();
  User? user;
  List<ServiceSiniestro> list=[];
  List<ServiceSiniestro> list_all=[];
  ApiService? _apiService;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    if(this.user == null) {
      this.user = await User.fromJson(await sharedPref.read('empleado'));
      this._apiService = new ApiService(user.toString());
      await getListaServicesNoConfirm();
      refresh();
      await getListaServicesAll();
      print(this.list_all);
    }else{
      print('hay user');
    }
    refresh();
  }

  Future<void> getListaServicesNoConfirm() async {
    ResponseApi response = await _apiService!.getSolicitudesNoConfirm(this.user!.id);
    print(response);
    if (response.success) {
      MySnackbar.show(context!, response.message);
      var data=response.data;
      print('data de response');
      print(data);
      for(var i = 0; i< data.length; i++) {
        ServiceSiniestro sol=ServiceSiniestro.fromJson(data[i]);
        this.list.add(sol);
      }
      print(this.list);
    }else{
      MySnackbar.show(context!, response.message);
    }
  }

  Future<void> getListaServicesAll() async {
    ResponseApi response = await _apiService!.getServicesAll(this.user!.id);
    print(response);
    if (response.success) {
      MySnackbar.show(context!, response.message);
      var data=response.data;
      print('data de response');
      print(data);
      for(var i = 0; i< data.length; i++) {
        ServiceSiniestro sol=ServiceSiniestro.fromJson(data[i]);
        this.list_all.add(sol);
      }
      print(this.list_all);
    }else{
      MySnackbar.show(context!, response.message);
    }
  }

}