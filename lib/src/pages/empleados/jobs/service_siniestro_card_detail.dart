import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/models/service_siniestro.dart';
import 'package:seguro_motors_final/src/pages/empleados/jobs/service_siniestro_controller.dart';

class ServiceSiniestroDetailScreen extends StatefulWidget {
  final ServiceSiniestro? data;
  final ServiceSiniestroController? con;
  const ServiceSiniestroDetailScreen({Key? key, this.data, this.con}) : super(key: key);

  @override
  State<ServiceSiniestroDetailScreen> createState() => _ServiceSiniestroDetailScreenState();
}

class _ServiceSiniestroDetailScreenState extends State<ServiceSiniestroDetailScreen> {


  @override
  Widget build(BuildContext context){
    print('detail screen');
    print(widget.data!.longitude);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                /*DetailHeader(data: widget.con.soliSoporte),
                DetailContent(data: widget.con.soliSoporte, con: widget.con),*/
              ],
            ),
            //DetailFooter(data: widget.con.soliSoporte,con: widget.con,sop: widget.data),
          ],
        ),
      ),
    );
  }

}