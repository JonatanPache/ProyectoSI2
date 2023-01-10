import 'package:flutter/material.dart';
import 'package:seguro_motors_final/src/models/solicitud_siniestro.dart';
import 'package:seguro_motors_final/src/pages/siniestros/soli_siniestro_controller.dart';

class SoliSiniestroDetailScreen extends StatefulWidget {
  final SolicitudSiniestro? data;
  final SoliSiniestroController? con;
  const SoliSiniestroDetailScreen({Key? key, this.data, this.con}) : super(key: key);

  @override
  State<SoliSiniestroDetailScreen> createState() => _SoliSiniestroDetailScreenState();
}

class _SoliSiniestroDetailScreenState extends State<SoliSiniestroDetailScreen> {


  @override
  Widget build(BuildContext context){
    print('detail screen');
    print(widget.data!.date_solicitud);
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