import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguro_motors_final/src/utils/style/colors.dart';
import 'package:seguro_motors_final/src/utils/style/style.dart';

class PaymentListTile extends StatelessWidget {
  final String icon;
  final String label;
  final String amount;

  const PaymentListTile({
    required this.icon,
    required this.label,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 20),
      visualDensity: VisualDensity.standard,
      leading: Container(
          width: 50,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset(icon, width: 20,)
    ),
      title:Text(
          label,
          style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w500
          )
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pagado',
            style: GoogleFonts.openSans(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            )
          ),
          Text(
              amount,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )
          ),
        ],
      ),
      onTap: () {print('tap');},
      selected: true,
    );
  }
}