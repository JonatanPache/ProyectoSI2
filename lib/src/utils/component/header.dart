import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguro_motors_final/src/utils/style/colors.dart';
import 'package:seguro_motors_final/src/utils/style/style.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SeguroMotors',
                style:GoogleFonts.openSans(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                )
              ),
              Text(
                  'Contigo... Donde estes',
                  style:GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                      color: AppColors.secondary
                  )
              ),
            ],
          ),
        ),
        Spacer(flex: 1),

      ],
    );
  }
}