import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguro_motors_final/src/pages/profile/profile_edit_page.dart';
import 'package:seguro_motors_final/src/pages/profile/profile_menu.dart';
import 'package:seguro_motors_final/src/pages/profile/profile_pic.dart';
import 'package:seguro_motors_final/src/pages/profile/profile_settings_page.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SharedPref _sharePref = new SharedPref();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(height: 20),
          ProfilePic(),
          SizedBox(height: 10),
          ProfileMenu(
            icon: "assets/svg/bank.svg",
            text: "Mis Datos",
            press: (){
                Route route=MaterialPageRoute(builder: (context)=>ProfileEditPage());
                Navigator.push(context, route).then(onGoBack);
            },
          ),
          ProfileMenu(
            icon: "assets/svg/bank.svg",
            text: "Notificaciones",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/svg/bank.svg",
            text: "Settings",
            press: () {
              Route route=MaterialPageRoute(builder: (context)=>ProfileSettingsPage());
              Navigator.push(context, route).then(onGoBack);
            },
          ),
          ProfileMenu(
            icon: "assets/svg/bank.svg",
            text: "Help Center",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/svg/bank.svg",
            text: "Cerrar Session",
            press: () => logout(),
          ),
        ]),
      ),
    );
  }

  Future<void> logout() async {
    final form = _formKey.currentState;
    if (!form!.validate()) return;
    final AuthProvider provider =
        Provider.of<AuthProvider>(context, listen: false);
    await provider.logout();
    await _sharePref.remove('cliente');
    await _sharePref.remove('empleado');
    Navigator.pop(context,'login');
  }

  FutureOr onGoBack(dynamic value){
    setState(() {

    });
  }
}
