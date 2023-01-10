import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/widgets/search_control.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/widgets/search_tag.dart';

class HomeSubHeader extends StatelessWidget {
  const HomeSubHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: SearchControl(),
              ),
              SizedBox(width: kSpacingUnit * 2),
              /*CircleAvatar(
                radius: kSpacingUnit * 2,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),*/
            ],
          ),
          SizedBox(height: kSpacingUnit * 1),
          Row(
            children: [
              SearchTag(tag: 'Up',color: 0xFF2F4F4F,),
              SearchTag(tag: 'Cancelled',color: 0xFFED5575),
              SearchTag(tag: 'New',color: 0xFFDAA520	,),
            ],
          )
        ],
      ),
    );
  }
}
