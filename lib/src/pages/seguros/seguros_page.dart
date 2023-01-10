import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/pages/enums.dart';
import 'package:seguro_motors_final/src/pages/seguros/body_seguros.dart';
import 'package:seguro_motors_final/src/utils/component/custom_bottom_nav_bar.dart';
import 'package:seguro_motors_final/src/utils/constant.dart';


class SegurosPage extends StatefulWidget {
  const SegurosPage({Key? key}) : super(key: key);

  @override
  State<SegurosPage> createState() => _SegurosPageState();
}

class _SegurosPageState extends State<SegurosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: BodySeguros(),
        bottomNavigationBar: CustomBottomNavBar(
            selectMenu: MenuState.seguros
        )
    );
  }
}
