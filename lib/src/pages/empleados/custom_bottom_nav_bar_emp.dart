import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/pages/enums.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:seguro_motors_final/src/utils/constant.dart';
import 'package:seguro_motors_final/src/utils/component/custom_controller.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';

class CustomBottomNavBarEmp extends StatefulWidget {
  const CustomBottomNavBarEmp({
    Key? key,
    @required this.selectMenu,
  }) : super(key: key);

  final MenuState? selectMenu;

  @override
  State<CustomBottomNavBarEmp> createState() => _CustomBottomNavBarEmpState();
}

class _CustomBottomNavBarEmpState extends State<CustomBottomNavBarEmp> {

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: gradientStartColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36)),
          ),
      child: SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
             IconButton(
                 onPressed: () => Navigator.pushNamed(context, 'dashboard'),
                 icon: SvgPicture.asset(
                   "assets/svg/home.svg",
                   color: MenuState.dashboard == widget.selectMenu
                    ? buttonColor
                    : inActiveIconColor,
                   fit: BoxFit.fill,
              )),
          if (authProvider.isAuthenticated)
            IconButton(
                onPressed:
                    () => Navigator.popAndPushNamed(context, 'empleado/siniestros/service/list'),
                icon: SvgPicture.asset(
                  "assets/svg/invoice.svg",
                  color: MenuState.siniestros == widget.selectMenu
                      ? Colors.teal
                      : inActiveIconColor,
                  fit: BoxFit.fill,
                )),
          IconButton(
              onPressed: () => Navigator.popAndPushNamed(context, 'seguros'),
              icon: SvgPicture.asset(
                "assets/svg/clipboard.svg",
                color: MenuState.seguros == widget.selectMenu
                    ? Colors.teal
                    : inActiveIconColor,
                fit: BoxFit.fill,
              )),
          IconButton(
              onPressed: () => Navigator.popAndPushNamed(context, 'profile'),
              icon: SvgPicture.asset(
                "assets/svg/user.svg",
                color: MenuState.profile == widget.selectMenu
                    ? Colors.teal
                    : inActiveIconColor,
                fit: BoxFit.fill,
              ))
        ]),
      ),
    );
  }

  void refresh(){
    setState(() {

    });
  }
}
