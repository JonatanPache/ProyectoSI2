import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguro_motors_final/src/pages/profile/user_data.dart';
import 'package:seguro_motors_final/src/pages/profile/widgets/app_bar_widget.dart';
import 'package:string_validator/string_validator.dart';

class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  State<EditNameFormPage> createState() => _EditNameFormPageState();
}

class _EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey=GlobalKey<FormState>();
  final firstNameController=TextEditingController();
  final secondNameController=TextEditingController();
  var user=UserData.myUser;
  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name){
    user.name=name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 330,
              child: Text(
                  'Cual es tu nombre?',
                  style: GoogleFonts.openSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 46  , 16, 0),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: TextFormField(
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'Por favor, ingrese su nombre';
                        }else if (!isAlpha(value)){
                          return 'Solo letras.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Nombres'
                      ),
                      controller: firstNameController,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 46  , 16, 0),
                  child: SizedBox(
                    height: 100,
                    width: 150,
                    child: TextFormField(
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return 'Por favor, ingrese su apelido';
                        }else if (!isAlpha(value)){
                          return 'Solo letras.';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Apellidos'
                      ),
                      controller: secondNameController,
                    ),
                  ),
                ),
              ],
            ),
            //button update
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate() &&
                        isAlpha(firstNameController.text +
                            secondNameController.text)){
                        updateUserValue(firstNameController.text+
                            ''+secondNameController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Actualizar',
                      style: GoogleFonts.openSans(
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
