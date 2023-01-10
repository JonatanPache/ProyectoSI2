import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguro_motors_final/src/utils/component/paymentListTile.dart';
import 'package:seguro_motors_final/src/utils/config/size_config.dart';
import 'package:seguro_motors_final/src/utils/style/colors.dart';
import 'package:seguro_motors_final/src/utils/style/style.dart';
import '../data.dart';

class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical * 5,
      ),
      // image card credit
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0,
              offset: const Offset(10.0, 15.0,),
            )]
        ),
        child: Image.asset('assets/img/card.png')
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 5,),
      // texto actividades recientes
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Actividades Recientes',
              style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              )
          ),
          Text(
              '02 Mar 2021',
              style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              )
          ),
        ],
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 2),
      // items pagos
      Column(
        children: List.generate(
          recentActivities.length,
              (index) => PaymentListTile(
              icon: recentActivities[index]["icon"]??"",
              label: recentActivities[index]["label"]??"",
              amount: recentActivities[index]["amount"]??""),
        ),
      ),
      SizedBox(height: SizeConfig.blockSizeVertical * 5,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Pagos Retrasados',
              style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              )
          ),
          Text(
              '02 Mar 2021',
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                color: AppColors.secondary,
              )
          )
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 2,
      ),
      Column(
        children: List.generate(
          upcomingPayments.length,
              (index) => PaymentListTile(
              icon: upcomingPayments[index]["icon"]??'',
              label: upcomingPayments[index]["label"]??"",
              amount: upcomingPayments[index]["amount"]??""),
        ),
      ),
    ]);
  }
}