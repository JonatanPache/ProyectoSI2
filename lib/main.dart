import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguro_motors_final/src/pages/dashboard/dashboard_page.dart';
import 'package:seguro_motors_final/src/pages/login/login.dart';
import 'package:seguro_motors_final/src/pages/profile/cliente_profile_page.dart';
import 'package:seguro_motors_final/src/pages/profile/profile_edit_page.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/client_polizas_list_page.dart';
import 'package:seguro_motors_final/src/pages/seguros/seguros_page.dart';
import 'package:seguro_motors_final/src/pages/empleados/jobs/serv_siniestro_page.dart';
import 'package:seguro_motors_final/src/pages/siniestros/soli_siniestro_page.dart';
import 'package:seguro_motors_final/src/pages/siniestros/solicitudes/siniestros_create_page.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:seguro_motors_final/src/providers/poliza_provider.dart';
import 'package:seguro_motors_final/src/providers/push_notification_provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:seguro_motors_final/src/pages/chatbot/chatbot_page.dart';

PushNotificationProvider pushNotificationProvider=new PushNotificationProvider();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  FirebaseApp app=await Firebase.initializeApp();
  print('Iniciando servicio de notificaciones: $app');
  print('Handling a background message ${message.messageId}');
}


void main() async {
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  pushNotificationProvider.initNotifications();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    pushNotificationProvider.onMessageListener();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<PolizaProvider>(
                  create: (context) => PolizaProvider(authProvider))
            ],
            child: MaterialApp(
              title: 'SeguroMotors',
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (context) {
                  final authProvider = Provider.of<AuthProvider>(context);
                  if (authProvider.isAuthenticated) {
                    return DashboardPage();
                  } else {
                    return LoginPage();
                  }
                },
                'login':(BuildContext context)=>
                    LoginPage(),
                'dashboard':(BuildContext context)=>
                    DashboardPage(),
                'profile':(BuildContext context)=>
                    ClienteProfilePage(),
                'seguros':(BuildContext context)=>
                    SegurosPage(),
                'seguros/polizas/list':(BuildContext context)=>
                    ClientPolizasListPage(),
                'profile_edit':(BuildContext context)=>
                    ProfileEditPage(),
                'servicios':(BuildContext context)=>
                    ProfileEditPage(),
                'siniestro/solicitud/list':(BuildContext context)=>
                    SolicitudSiniestroPage(),
                'siniestros/solicitudes/create':(BuildContext context)=>
                    SiniestrosSolicitudCreatePage(),
                'empleado/siniestros/service/list':(BuildContext context)=>
                    ServiceSiniestroPage(),
                'chatbot':(BuildContext context)=>
                    ChatbotPage()
              },
            ),
          );
        },
      ),
    );
  }
}