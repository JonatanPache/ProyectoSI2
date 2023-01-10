import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seguro_motors_final/src/pages/empleados/jobs/service_siniestro_controller.dart';
import 'package:seguro_motors_final/src/pages/empleados/jobs/service_siniestro_card_detail.dart';
import 'package:seguro_motors_final/src/pages/siniestros/soli_tag.dart';
import 'package:seguro_motors_final/src/models/service_siniestro.dart';

class ServiceCard extends StatelessWidget {
  final ServiceSiniestro? data;
  final ServiceSiniestroController con;
  const ServiceCard({Key? key, @required this.data, required this.con}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("date "+data!.totalCosto);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 20.w,
            offset: Offset(10.w,10.w)
        ),]
      ),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 500),
        openColor: Colors.white54,
        openElevation: 1,
        openBuilder: (context, action) {
          return ServiceSiniestroDetailScreen(data: data,con: con);
        },
        closedColor: Colors.black45,
        closedElevation: 0,
        closedBuilder: (context, action) {
          return Container(
            height: 85,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/user.svg',
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(width: 1),
                    Text(
                      "Nro Solicitud: SOL-00"+data!.solicitudSiniestroId!??'1',
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/svg/document.svg',
                      height: 20.sp,
                      width: 20.sp,
                    ),
                  ],
                ),
                /*SizedBox(height: 2),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      data!.cliente_id !=null?"Fecha: "+data!.:'A',
                    ),
                  ],
                ),*/
                SizedBox(height: 2),
                Row(
                  children: [
                    (data!.status == 'new')?
                    SoliSiniestroTag(tag: 'New',color: 0xFFDAA520):
                    (data!.status == 'up')?
                    SoliSiniestroTag(tag: 'Up',color: 0xFF2F4F4F,):
                    (data!.status == 'cancelled')?
                    SoliSiniestroTag(tag: 'Cancelled',color: 0xFFED5575):
                    SoliSiniestroTag(tag: 'New',color: 0xFFDAA520	,),
                  ],
                )
                /*Text(
                  data.estado!=null?"Estado: "+data.estado:'da',
                  style: kCaptionTextStyle,
                ),*/
              ],
            ),
          );
        },
      ),
    );
  }
}