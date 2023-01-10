import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seguro_motors_final/src/pages/enums.dart';
import 'package:seguro_motors_final/src/utils/component/barChartComponent.dart';
import 'package:seguro_motors_final/src/utils/component/custom_bottom_nav_bar.dart';
import 'package:seguro_motors_final/src/utils/component/header.dart';
import 'package:seguro_motors_final/src/utils/component/historyTable.dart';
import 'package:seguro_motors_final/src/utils/component/infoCard.dart';
import 'package:seguro_motors_final/src/utils/component/paymentDatilList.dart';
import 'package:seguro_motors_final/src/utils/config/size_config.dart';
import 'package:seguro_motors_final/src/utils/style/colors.dart';
import 'package:seguro_motors_final/src/pages/dashboard/dashboard_controller.dart';
import 'package:seguro_motors_final/src/pages/empleados/custom_bottom_nav_bar_emp.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //const DashboardPage({Key key}) : super(key: key);
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  PickedFile? pickedFile;
  XFile? picked;
  File? imageFile;
  DashboardController _control=new DashboardController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _control.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: CustomBottomNavBar(
        selectMenu: MenuState.dashboard,
      ),
      body: Container(
        child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(
                flex: 250,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.blockSizeVertical * 1),
                        Header(),
                        SizedBox(height: SizeConfig.blockSizeVertical * 3),
                        // buscador
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.white,
                              contentPadding:
                                  EdgeInsets.only(left: 13, right: 5),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: AppColors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: AppColors.white)),
                              suffixIcon: Icon(
                                Icons.search,
                                color: AppColors.black,
                              ),
                              hintText: 'Buscar',
                              hintStyle: GoogleFonts.openSans(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: AppColors.secondary
                              )
                          ),
                        ),
                        SizedBox(height: 40),
                        //(_control!.user!.rol_id == 1)?
                        // buttons
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10.0,
                            runSpacing: 20.0,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){},
                                child: InfoCard(
                                  icon: 'assets/svg/transfer.svg',
                                  label: 'Cotizar      \nOnline',
                                  amount: '\$150',
                                ),
                              ),
                              GestureDetector(
                                onTap: (){showAlertDialog(context);},
                                child: InfoCard(
                                  icon: 'assets/svg/car.svg',
                                  label: 'Reportar        \nSiniestro ',
                                  amount: '\$1500',
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, 'chatbot');
                                },
                                child: InfoCard(
                                  icon: 'assets/svg/invoice.svg',
                                  label: 'Ayuda \nVia QR',
                                  amount: '\$1500',
                                ),
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: InfoCard(
                                  icon: 'assets/svg/credit-card.svg',
                                  label: 'Pagar poliza \nCard numero',
                                  amount: '\$1200',
                                ),
                              ),
                            ],
                          ),
                        ),//:
                        (_control!.user!.rol_id ==1)?
                        SizedBox(height: SizeConfig.blockSizeVertical * 5):
                        (_control!.user!.rol_id ==1)?
                        // texto reporte
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Reporte',
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text(
                                  'Servicios asistidos',
                                  style: GoogleFonts.openSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ):
                        (_control!.user!.rol_id ==1)?
                        SizedBox(height: SizeConfig.blockSizeVertical * 3):
                        //barChart
                        (_control!.user!.rol_id ==1)?
                        Container(
                            height: 200,
                            child: BarChartComponent(),
                          ):(_control!.user!.rol_id ==1)?
                        SizedBox(height: SizeConfig.blockSizeVertical * 5):
                        (_control!.user!.rol_id ==1)?
                        // texto historial transacciones
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Historial',
                                style: GoogleFonts.openSans(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700
                                )
                              ),
                              Text(
                                  'Transacciones ultimos 6 meses',
                                  style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    color: AppColors.secondary,
                                  )
                              ),
                            ],
                          ):
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Trabajos Pendientes',
                                style: GoogleFonts.openSans(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700
                                )
                            ),
                            /*Text(
                                'Transacciones ultimos 6 meses',
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondary,
                                )
                            ),*/
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockSizeVertical * 3),
                        //tabla historial
                        HistoryTable(),
                        //PaymentDetailList()
                      ],
                    ),
                  ),
                )),
          ],
        )),
      ),
    );
  }

  void showAlertDialog(BuildContext context){
    Widget yesButton=ElevatedButton(
        onPressed: (){
          selectImage(ImageSource.camera);
        },
        child: Text('Si')
    );

    Widget noButton=ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, 'siniestros/solicitudes/create');
        },
        child: Text('No')
    );

    AlertDialog alertDialog=AlertDialog(
      title: Text('Estas en el lugar del siniestro?'),
      actions: [
        yesButton,
        noButton
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        });
  }

  Future selectImage(ImageSource imageSource) async{
    picked=await ImagePicker().pickImage(source: imageSource);
    if(picked!=null){
      imageFile=File(picked!.path);
    }
    Navigator.pop(context);
    refresh();
  }

  void refresh(){
    setState(() {

    });
  }
}