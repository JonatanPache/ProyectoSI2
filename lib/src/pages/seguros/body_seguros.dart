import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seguro_motors_final/src/pages/seguros/data_seguros.dart';
import 'package:seguro_motors_final/src/pages/seguros/detail_page.dart';
import 'package:seguro_motors_final/src/pages/seguros/seguros_controller.dart';
import 'package:seguro_motors_final/src/providers/auth_provider.dart';
import 'package:seguro_motors_final/src/utils/constant.dart';

class BodySeguros extends StatefulWidget {
  const BodySeguros({Key? key}) : super(key: key);

  @override
  State<BodySeguros> createState() => _BodySegurosState();
}

class _BodySegurosState extends State<BodySeguros> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SegurosController cont=new SegurosController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      cont.init(context, refresh);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Container(
            child: SafeArea(
                child: Column(
                    children: <Widget>[
                      // cabezar titulo drowdown tipo de auto
                      Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Column(
                            children: <Widget>[
                              //tus coches
                              Text('Tus Coches',
                                style: GoogleFonts.openSans(
                                  fontSize: 44,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              //dropdown
                              /*DropdownButton(
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Cuatro Ruedas',
                                      style: GoogleFonts.openSans(
                                          fontSize: 24,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                                onChanged: (value) {},
                              )*/
                            ],
                          )
                      ),
                      Container(
                        height: 500,
                        padding: const EdgeInsets.all(32),
                        child: Swiper(
                            itemCount: cars.length,
                            itemWidth: MediaQuery.of(context).size.width - 2 * 44,
                            layout: SwiperLayout.STACK,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){Navigator.push(context,
                                      PageRouteBuilder(
                                        pageBuilder: (context,a,b)=>
                                            DetailPage(planetInfo: cars[index]),
                                      )
                                  );
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        SizedBox(height: 100),
                                        Card(
                                            elevation: 8,
                                            shadowColor: Colors.black87,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(32)),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(32.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(height:90),
                                                  Text(
                                                    cars[index].name,
                                                    style: TextStyle(
                                                        fontFamily: 'Avenir',
                                                        fontSize: 44,
                                                        color: primaryTextColor,
                                                        fontWeight: FontWeight.w900),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    '2017',
                                                    style: TextStyle(
                                                        fontFamily: 'Avenir',
                                                        fontSize: 23,
                                                        color: primaryTextColor,
                                                        fontWeight: FontWeight.w500),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  SizedBox(height: 30),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        'Know more',
                                                        style: TextStyle(
                                                            fontFamily: 'Avenir',
                                                            fontSize: 18,
                                                            color: secondaryTextColor,
                                                            fontWeight: FontWeight.w500),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        color: secondaryTextColor,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                    Hero(
                                        tag:cars[index].position,
                                        child: Image.asset(
                                          (cars[index].iconImage),
                                          width: 230,
                                          height: 210,
                                        )
                                    )
                                  ],
                                ),
                              );
                            }),
                      )
                    ])),
          ),
        ));
  }


  void refresh(){
    setState(() {

    });
  }
}
