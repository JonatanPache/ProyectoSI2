import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguro_motors_final/src/pages/profile/edit_image_page.dart';
import 'package:seguro_motors_final/src/pages/profile/edit_name.dart';
import 'package:seguro_motors_final/src/pages/profile/user_data.dart';
import 'package:seguro_motors_final/src/pages/profile/widgets/display_image_widget.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);
  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final user=UserData.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          AppBar(
            iconTheme: IconThemeData(
                color: Colors.black
            ),
            leading: BackButton(),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          Center(
           child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Editar Perfil',
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(64, 105, 225, 1),
                ),
              )
           )
          ),
          InkWell(
            onTap: (){navigateSecondPage(EditImagePage());},
            child: DisplayImage(
              imgPath: user.image,
              onPressed: (){},
            ),
          ),
          buildUserInfoDisplay(user.name,'NAME',EditNameFormPage()),
          buildUserInfoDisplay(user.name,'NAME',EditNameFormPage()),
          buildUserInfoDisplay(user.name,'NAME',EditNameFormPage()),
          buildUserInfoDisplay(user.name,'NAME',EditNameFormPage()),

    ]));
  }

  Widget buildUserInfoDisplay(String getValue, String title,Widget editPage)=>Padding(
      padding: EdgeInsets.only(bottom: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey
            )
        ),
        SizedBox(height: 1,),
        Container(
          width: 350,
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1
              )
            )
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                    onPressed: (){
                      navigateSecondPage(editPage);
                    },
                    child: Text(
                        getValue,
                      style: TextStyle(
                          fontSize: 16,
                        height: 1.4
                      ),
                    ),
                  )),
              Icon(
                  Icons.keyboard_arrow_right,
                color: Colors.grey,
                size: 40.0,
              )
            ],
          ),
        )
      ],
    ),

  );
  void navigateSecondPage(Widget editForm){
    Route route=MaterialPageRoute(builder: (context)=>editForm);
    Navigator.push(context, route).then(onGoBack);
  }

  FutureOr onGoBack(dynamic value){
    setState(() {

    });
  }
}
