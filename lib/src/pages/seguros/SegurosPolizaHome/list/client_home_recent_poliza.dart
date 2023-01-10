import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_poliza_card.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_polizas_list_controller.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';
import 'package:seguro_motors_final/src/pages/seguros/data_seguros.dart';

class ClientHomeRecentPolizas extends StatefulWidget {
  const ClientHomeRecentPolizas({
    Key? key,
    this.con
  }) : super(key: key);
  
  final ClientPolizasController? con;
  
  @override 
  State<ClientHomeRecentPolizas> createState()=> _ClientHomeRecentPolizasState();
}
class _ClientHomeRecentPolizasState extends State<ClientHomeRecentPolizas>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: cars
            .asMap()
            .entries
            .map(
              (item) => Container(
                margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 3).copyWith(
                    top: item.key == 0 ? kSpacingUnit * 2 : 0,
                    bottom: kSpacingUnit * 2,
                ),
                child: ClientPolizaCard(
                  data: item?.value,
                  //tecList: con.tecList,
                  con: widget.con,
                ),
              ),
           ).toList(),
        )
      );
  }
/*
  cars.asMap().entries.map(
              (item) => Container(
                margin: EdgeInsets.symmetric(horizontal: kSpacingUnit * 3).copyWith(
                  top: item.key == 0 ? kSpacingUnit * 2 : 0,
                  bottom: kSpacingUnit * 2,
                ),
                child: SolicitudCard(
                    data: item.value
                ),
              ),
            )
            .toList()
*/
  void refresh(){
    setState(() {

    });
  }
}
