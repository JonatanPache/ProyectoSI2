import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seguro_motors_final/src/api/api_services.dart';
import 'package:seguro_motors_final/src/models/response_api.dart';
import 'package:seguro_motors_final/src/models/solicitud_siniestro.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:seguro_motors_final/src/utils/my_snakbar.dart';
import 'dart:core';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class SiniestrosCreateController {
  BuildContext? context;
  Function? refresh;
  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  SharedPref sharedPref = new SharedPref();
  User? user;
  ProgressDialog? _progressDialog;
  final List<_PositionItem> _positionItems = <_PositionItem>[];
  String? lat;
  String? long;
  ApiService? _apiService;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    this._progressDialog = ProgressDialog(context: context);
    this.user = User.fromJson(await sharedPref.read('cliente'));
    /*if(this.user != null){
      this.user = User.fromJson(await sharedPref.read('empleado'));
    }*/
    print(user!);
    this._apiService=new ApiService(user!.remember_token);
    await getCurrentLocation();
    print('latitude: '+this.lat!);
    refresh();
  }

  void createSolicitud() async {
    String description = descriptionController.text;
    DateTime today = DateTime.now();
    String dateSlug =
        "${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    if (dateSlug.isEmpty || description.isEmpty) {
      MySnackbar.show(context!, 'Debe ingresar todos los campos');
      return;
    }
    SolicitudSiniestro solicitud =new SolicitudSiniestro(
        description: description,
        date_solicitud: dateSlug,
        cliente_id: user!.id,
        latitude: this.lat.toString(),
        longitude: this.long.toString());
    print(dateSlug);
    print(solicitud.toJson());
    ResponseApi response = await _apiService!.createSiniestro(solicitud);
    print(response);
    if (response.success) {
      MySnackbar.show(this.context!, response.message);
      Navigator.pushNamed(this.context!, 'siniestro/solicitud/list');
    }
    //print('Producto:${product.toJson()}');
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    await Geolocator.getCurrentPosition().then((value) => {
          _positionItems.add(_PositionItem(_PositionItemType.position,
              value.toString(), value.latitude, value.longitude))
        });
    this.lat=_positionItems[_positionItems.length-1].latitude.toString();
    this.long=_positionItems[_positionItems.length-1].longitude.toString();

  }
}

enum _PositionItemType {
  permission,
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue, this.latitude, this.longitude);
  final _PositionItemType type;
  final String displayValue;
  final double latitude;
  final double longitude;
}
