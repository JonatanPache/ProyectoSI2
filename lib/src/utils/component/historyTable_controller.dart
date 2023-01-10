import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/api/api_services.dart';
import 'package:seguro_motors_final/src/models/response_api.dart';
import 'package:seguro_motors_final/src/models/service_siniestro.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/utils/my_snakbar.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';
class HistoryTableController{
  BuildContext? context;
  Function? refresh;
  SharedPref sharedPref = new SharedPref();
  User? user;
  List<ServiceSiniestro> list=[];
  ApiService? _apiService;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    if(User.fromJson(await sharedPref.read('cliente'))==null){
      this.user = User.fromJson(await sharedPref.read('empleado'));
    }else{
      this.user =User.fromJson(await sharedPref.read('cliente'));
    }
    print(user.toString()!);
    this._apiService=new ApiService(user!.remember_token);
    await getService();
    refresh();
  }

  Future<void> getService() async {
    ResponseApi response = await _apiService!.getServicesNoConfirm(this.user!.id);
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
}