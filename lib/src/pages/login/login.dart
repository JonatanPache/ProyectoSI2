import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:seguro_motors_final/src/models/response_api.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:seguro_motors_final/src/providers/push_notification_provider.dart';
import 'package:seguro_motors_final/src/utils/my_snakbar.dart';
import 'package:seguro_motors_final/src/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PushNotificationProvider pushNotificationProvider=new PushNotificationProvider();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  SharedPref _sharePref = new SharedPref();

  @override
  void initState() {
    super.initState();
    getDeviceName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: Form(
            key: _formKey,
            child:SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //lottie animation
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: MediaQuery.of(context).size.height*0.02
                    ),
                    child: Lottie.asset(
                      'assets/json/hello-office.json',
                      width: 305,
                      height: 200,
                      fit: BoxFit.fill
                    ),
                  ),
                  // Texto 'SeguroMotors'
                  Text(
                    'SeguroMotors',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 50
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Bienvenido
                  Text(
                    'Bienvenido',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                  )
                ),
                  SizedBox(
                    height: 50,
                  ),
                  //Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(13)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (String? value) {
                            if (value!.trim().isEmpty) return '*Ingrese Email';
                            return null;
                          },
                          onChanged: (text) =>
                              setState(() => errorMessage = ''),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            suffixIcon: Icon(
                                Icons.mail,
                              color: Colors.black54,
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(13)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passwordController,
                          validator: (String? value) {
                            if (value!.isEmpty) return '*Ingrese contrasena';
                            return null;
                          },
                          onChanged: (text) =>
                              setState(() => errorMessage = ''),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Contrasena',
                              suffixIcon: Icon(
                                  Iconsax.password_check,
                                color: Colors.black54,
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // button ingresar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13)
                      ),
                      child: FloatingActionButton.extended(
                        backgroundColor: Colors.deepOrangeAccent,
                        icon: Icon(
                            Icons.arrow_forward_ios,
                          size: 24.0,
                        ),
                        onPressed: () => submit(),
                        label: Text(
                          'Ingresar',
                          style:GoogleFonts.openSans(
                            fontSize: 18,
                            color: Colors.white,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                    ),
                  ),
                ),
                  SizedBox(height: 25),
                  Text(
                    errorMessage??'',
                    style: TextStyle(
                        color: Colors.red,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  // not a member register now
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No tienes cuenta',
                          style:TextStyle(
                              fontWeight: FontWeight.bold
                          )
                      ),
                      Text(
                        ' Registrate Ahora',
                        style:TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ],
                  )*/
              ],
          ),
            )
        ),
      ),
    );
  }

  Future<void> submit() async {
    print('enviando login');
    final form = _formKey.currentState;
    if (!form!.validate()) return;
    final AuthProvider provider =
    Provider.of<AuthProvider>(context, listen: false);
    try {
      ResponseApi responseApi =await provider.login(
          emailController.text,
          passwordController.text,
          _deviceData['model']
      );
      MySnackbar.show(context, responseApi.message);
      if(responseApi.success){
        User user = User.fromJson(responseApi.data);
        print('Usuario logeado: ${user.toJson()}');
        if(user.rol_id == 1){ //cliente
          _sharePref.save('cliente', user.toJson());
        }else if(user.rol_id == 3){ //empleado
          _sharePref.save('empleado', user.toJson());
        }
        _sharePref.save('cliente', user.toJson());
        // guardamos el token de firebase para notifications
        await pushNotificationProvider.saveToken(context);
      }
      MySnackbar.show(context, responseApi.message);
    } catch (exception) {
      /*setState(() {
        errorMessage = exception.toString().replaceAll('Exception: ', '');
      });*/
      MySnackbar.show(context, exception.toString().replaceAll('Exception: ', ''));
    }
  }

  Future<void> getDeviceName() async {
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData =
            _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      //'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }
  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
