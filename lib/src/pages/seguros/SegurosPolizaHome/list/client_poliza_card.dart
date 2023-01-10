import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_polizas_list_controller.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';
import 'package:seguro_motors_final/src/pages/seguros/data_seguros.dart';

class ClientPolizaCard extends StatelessWidget {
  final CarInfo? data;
  final ClientPolizasController? con;
  const ClientPolizaCard({Key? key, @required this.data,this.con}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nro_sol=data!.name.toString();
    return Container(
      decoration: BoxDecoration(
        boxShadow: [kCardShadow],
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: kSilverColor,
        openElevation: 0,
        openBuilder: (context, action) {
          return Text('prueba');//ClienteDetailScreen(data: data,con: con);
        },
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            height: 125.w,
            padding: EdgeInsets.all(kSpacingUnit * 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(kSpacingUnit * 3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/img/user-circle.svg',
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    SizedBox(width: kSpacingUnit),
                    Text(
                      nro_sol!=null?"Nro solicitud: "+nro_sol:'a',
                      style: kCardTitleTextStyle,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/heart_icon.svg',
                      height: 20.sp,
                      width: 20.sp,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  data!.name!=null?"Longitude: "+data!.name:'A',
                  style: kSubTitleTextStyle,
                ),
                SizedBox(height: kSpacingUnit * 0.5),
                Text(
                  data!.name!=null?"Latitude: "+data!.name:'da',
                  style: kCaptionTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
