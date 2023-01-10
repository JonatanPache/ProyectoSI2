import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';
import 'package:seguro_motors_final/src/models/service_siniestro.dart';
class JobDetailPage extends StatefulWidget {
  const JobDetailPage({
    Key? key,
    @required this.data,
    //this.con
  }) : super(key: key);

  final ServiceSiniestro? data;
  //final TecnicoHomeContentController con;

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 4,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(kSpacingUnit * 5),
            topRight: Radius.circular(kSpacingUnit * 5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: kSpacingUnit * 5),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/img/user-circle.svg',
                      height: 50.sp,
                      width: 50.sp,
                    ),
                    //SizedBox(height: kSpacingUnit * 2),
                    //Text(fecha!=null?"Fecha Solcitada: "+fecha:'a'),
                    SizedBox(height: kSpacingUnit),
                    Text(widget.data!.status!=null?"Estado: "+widget.data!.status:" "),
                    /*Text(widget.data.cliente[0].ci_cliente!=null
                        ?"Phone: "+widget.data.cliente[0].ci_cliente
                        :" ")*/
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit),
              Text(
                'Descripcion del problema',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              Text(widget.data!.observaciones),
              SizedBox(height: kSpacingUnit * 15),
              Text(
                'Observaciones',
                style: kSubTitleTextStyle,
              ),
              SizedBox(height: kSpacingUnit * 2),
              _textFieldDescription(),
              //_dropDownTecnicos(widget)
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldDescription() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.zero
      ),
      child: TextField(
        maxLength: 255,
        maxLines: 3,
        //controller: widget.data.observaciones,
        decoration: InputDecoration(
            hintText: 'Escriba las observaciones',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic
            ),
            prefixIcon: Icon(
                Icons.list
            )
        ),
      ),
    );
  }


  void refresh(){
    setState(() {

    });
  }
}