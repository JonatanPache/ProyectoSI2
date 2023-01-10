import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:seguro_motors_final/src/pages/enums.dart';
import 'package:seguro_motors_final/src/pages/siniestros/soli_siniestro_card.dart';
import 'package:seguro_motors_final/src/pages/siniestros/soli_siniestro_controller.dart';
import 'package:seguro_motors_final/src/utils/component/custom_bottom_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SolicitudSiniestroPage extends StatefulWidget {
  const SolicitudSiniestroPage({Key? key}) : super(key: key);

  @override
  State<SolicitudSiniestroPage> createState() => _SolicitudSiniestroPageState();
}

class _SolicitudSiniestroPageState extends State<SolicitudSiniestroPage> {
  SoliSiniestroController _control = new SoliSiniestroController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _control.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Siniestros',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        bottomNavigationBar: CustomBottomNavBar(
          selectMenu: MenuState.siniestros,
        ),
        //body: Container(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _control.list
                          .asMap()
                          .entries
                          .map(
                          (item) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 25).copyWith(
                              top: item.key == 0 ? 4 : 0,
                              bottom: 8,
                            ),
                            child: SolicitudCard(
                              data: item.value,
                              con: _control,
                            ),
                          ),
                        )
                        .toList(),
              ),
                    ),
                  )),
            ],
          ),
        ));
  }

  void refresh() {
    setState(() {});
  }
}
