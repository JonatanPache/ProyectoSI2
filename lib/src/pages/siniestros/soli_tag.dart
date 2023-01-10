import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';

class SoliSiniestroTag extends StatelessWidget {
  final String? tag;
  final int? color;
  const SoliSiniestroTag({
    Key? key,
    this.tag,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color=new Color(this.color!);
    return Container(
      height: kSpacingUnit * 2.5,
      width: kSpacingUnit * 9,
      margin: EdgeInsets.only(left: kSpacingUnit),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: kSpacingUnit),
            Text(
              tag?? '',
              style: kCaptionTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/svg/close_icon.svg',
              height: 15.sp,
              width: 15.sp,
            ),
            SizedBox(width: kSpacingUnit * 0.5),
          ],
        ),
      ),
    );
  }
}
