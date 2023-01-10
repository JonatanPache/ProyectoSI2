import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:seguro_motors_final/src/pages/enums.dart';
import 'package:seguro_motors_final/src/pages/empleados/jobs/service_siniestro_card.dart';
import 'package:seguro_motors_final/src/pages/empleados/jobs/service_siniestro_controller.dart';
import 'package:seguro_motors_final/src/pages/empleados/custom_bottom_nav_bar_emp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seguro_motors_final/src/models/service_siniestro.dart';

class ServiceSiniestroPage extends StatefulWidget {
  final List<ServiceSiniestro>? list_all;
  const ServiceSiniestroPage({Key? key, this.list_all}) : super(key: key);

  @override
  State<ServiceSiniestroPage> createState() => _ServiceSiniestroPageState();
}

class _ServiceSiniestroPageState extends State<ServiceSiniestroPage> {
  ServiceSiniestroController _control = new ServiceSiniestroController();

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
    print('Page');
    print(_control!.user ??'nada');
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Trabajos',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        bottomNavigationBar: CustomBottomNavBarEmp(
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
                        children: _control!.list_all
                          .asMap()
                          .entries
                          .map(
                          (item) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 25).copyWith(
                              top: item.key == 0 ? 4 : 0,
                              bottom: 8,
                            ),
                            child: ServiceCard(
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

  refresh() {
    setState(() {});
  }
}
