import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';

class SearchControl extends StatelessWidget {
  const SearchControl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 4,
      decoration: BoxDecoration(
        color: kSilverColor,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: kSpacingUnit * 2),
            SvgPicture.asset(
              'assets/svg/search.svg',
              height: 15.sp,
              width: 15.sp,
            ),
            SizedBox(width: kSpacingUnit),
            Text(
              'Buscar poliza o solicitud ...',
              style: kBodyTextStyle.copyWith(
                color: kSecondaryTextColor,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/svg/slider_icon.svg',
              height: 15.sp,
              width: 15.sp,
            ),
            SizedBox(width: kSpacingUnit * 2),
          ],
        ),
      ),
    );
  }
}
