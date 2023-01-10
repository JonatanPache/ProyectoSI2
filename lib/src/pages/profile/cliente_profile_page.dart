import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/pages/enums.dart';
import 'package:seguro_motors_final/src/pages/profile/body.dart';
import 'package:seguro_motors_final/src/utils/component/custom_bottom_nav_bar.dart';

class ClienteProfilePage extends StatefulWidget {
  const ClienteProfilePage({Key? key}) : super(key: key);

  @override
  State<ClienteProfilePage> createState() => _ClienteProfilePageState();
}
class _ClienteProfilePageState extends State<ClienteProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: CustomBottomNavBar(
            selectMenu: MenuState.profile
        ),
      body: Body(),
    );
  }
}