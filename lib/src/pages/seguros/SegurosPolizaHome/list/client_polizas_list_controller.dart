import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/models/poliza.dart';
import 'package:seguro_motors_final/src/models/user.dart';

class ClientPolizasController{
  late BuildContext context;
  late Function refresh;
  //late SharedPref _sharedPref=new SharedPref();
  GlobalKey<ScaffoldState> key=new GlobalKey<ScaffoldState>();
  late User cliente;
  TextEditingController opinioController=new TextEditingController();


  Future init(BuildContext context, Function refresh) async{
    this.context=context;
    this.refresh=refresh;
    /*clienteProvider.init(context);
    cliente=Cliente.fromJson(await _sharedPref.read('cliente'));
    print('antes de crear solicitud');
    print(cliente.toJson());
    cantidad= await clienteProvider.getCantidadSolicitudes(cliente.id_cliente);
    await getSol();
    print(myList);*/
    refresh();
  }
/*
  void getSol() async{
    myList= await clienteProvider.getSolicitudes(cliente.id_cliente);
  }
  void logout(){
    _sharedPref.logout(context, cliente.id_cliente);
  }

  void getNameTecnico(String nro_solicitud) async{
    Soporte sop=await soporte.getByNroSoporte(nro_solicitud);
    print(sop);
    Tecnico tec= await tecnicoProvider.getById(sop.id_tecnico);
    print(tec);
    nameTec=tec.name;
    refresh();
  }

  void getObservaciones(SolicitudesSoporte sol) async{
    if(sol.estado=='En Proceso'){
      Soporte sop=await soporte.getByNroSoporte(sol.nro_solicitud);
      print(sop);
      obs=sop.observaciones;
      refresh();
    }

  }
  void openDrawer(){
    key.currentState.openDrawer();
  }

  void goToCreate(){
    Navigator.popAndPushNamed(context, 'cliente/solicitudes/create');
  }

  ElevatedButton showButton() {

      return ElevatedButton(
          onPressed: goToCreate,
          child: Text('Crear Nueva Solicitud')
      );


  }*/
}