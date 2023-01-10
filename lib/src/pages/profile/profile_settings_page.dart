import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:seguro_motors_final/src/providers/push_notification_provider.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {

  final PushNotificationProvider pushNotificationProvider=PushNotificationProvider();
  bool notif=false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final DateTime getDate=DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        title: Text(
          "Settings",
          style: GoogleFonts.openSans(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: BackButton(),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
              children: [
                SettingsGroup(
                    items: [
                      SettingsItem(
                        onTap: () {},
                        icons: CupertinoIcons.pencil_outline,
                        iconStyle: IconStyle(),
                        title: 'Appearance',
                        subtitle: "Make Ziar'App yours",
                      ),
                      SettingsItem(
                        onTap: () {},
                        icons: Icons.dark_mode_rounded,
                        iconStyle: IconStyle(
                          iconsColor: Colors.white,
                          withBackground: true,
                          backgroundColor: Colors.red,
                        ),
                        title: 'Dark mode',
                        subtitle: "Automatic",
                        trailing: Switch.adaptive(
                          value: false,
                          onChanged: (value) {},
                        ),
                      ),
                    ]
                ),
                SettingsGroup(
                  settingsGroupTitle: "Notificaciones",
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.calendar,
                      iconStyle: IconStyle(),
                      title: "Seguro",
                      subtitle: "Avisar pagos",
                      trailing: Switch.adaptive(
                        value: notif,
                        onChanged: (value) {
                          if(!notif){
                            pushNotificationProvider.scheduleNotification(getDate.hour,getDate.minute);
                            setState(() {
                              notif=value;
                            });
                          }else{
                            notif=value;
                            pushNotificationProvider.cancelNotification();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SettingsGroup(
                  settingsGroupTitle: "Account",
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.exit_to_app_rounded,
                      title: "Sign Out",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.repeat,
                      title: "Change email",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.delete_solid,
                      title: "Delete account",
                      titleStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ]
          )
      ),
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          AppBar(
            title: Text(
                'Settings',
              style: GoogleFonts.openSans(
                fontSize: 22,
                color: Colors.black
              ),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            leading: BackButton(),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),

            )
          )
        ])
    );
  }*/
}
