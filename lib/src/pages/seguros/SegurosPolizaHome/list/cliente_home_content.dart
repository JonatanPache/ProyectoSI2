import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_home_recent_poliza.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_polizas_list_controller.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';

class ClienteHomeContent extends StatefulWidget {
  const ClienteHomeContent({
    Key? key,
    this.con
  }) : super(key: key);

  final ClientPolizasController? con;

  @override
  State<ClienteHomeContent> createState()=>_ClienteHomeContentState();
}
class _ClienteHomeContentState extends State<ClienteHomeContent>{

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: kSilverColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSpacingUnit * 3),
            topRight: Radius.circular(kSpacingUnit * 3),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: kSpacingUnit * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
                /*child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Solicitudes',
                      style: kSubTitleTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('View All', style: kCardTitleTextStyle),
                  ],
                ),*/
              ),
             /* HomePopularJobs(),*/
              SizedBox(height: kSpacingUnit * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 4),
                child: Text(
                  'Solicitudes Recientes',
                  style: kSubTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ClientHomeRecentPolizas(con: widget.con),
            ],
          ),
        ),
      ),
    );
  }
}
