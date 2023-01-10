import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_home_sub_header.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_polizas_list_controller.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/cliente_home_content.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/cliente_home_header.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';

class ClientPolizasListPage extends StatefulWidget {
  const ClientPolizasListPage({Key? key}) : super(key: key);

  @override
  State<ClientPolizasListPage> createState() => _ClientPolizasListPageState();
}

class _ClientPolizasListPageState extends State<ClientPolizasListPage> {
  ClientPolizasController con=new ClientPolizasController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        title: Text(
          "Polizas",
          style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: BackButton(),
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              SizedBox(height:kSpacingUnit *0.5,width: 0.1),
              ClienteHomeHeader(),
              SizedBox(height:kSpacingUnit *0.8,width: 0.1),
              HomeSubHeader(),
              SizedBox(height:kSpacingUnit *6,width: 2),
              ClienteHomeContent(con: con),
              SizedBox(height:kSpacingUnit*15),
              /*con.cantidad=='0'?con.showButton():ElevatedButton(
                  onPressed: (){con.getSol();},
                  child: Text('Crear Nueva Solicitud')
              )*/
          ]
        )
      ),
    );
  }

  void refresh(){
    setState(() {

    });
  }
}
