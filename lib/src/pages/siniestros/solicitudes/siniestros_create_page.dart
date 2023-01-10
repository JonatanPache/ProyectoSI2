import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:seguro_motors_final/src/pages/seguros/SegurosPolizaHome/list/constantes_cliente.dart';
import 'package:seguro_motors_final/src/pages/siniestros/solicitudes/siniestros_create_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SiniestrosSolicitudCreatePage extends StatefulWidget {
  const SiniestrosSolicitudCreatePage({Key? key}) : super(key: key);

  @override
  State<SiniestrosSolicitudCreatePage> createState() => _SiniestrosSolicitudCreatePageState();
}

class _SiniestrosSolicitudCreatePageState extends State<SiniestrosSolicitudCreatePage> {
  SiniestrosCreateController _control = new SiniestrosCreateController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _control.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Solicitud Siniestro'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          _textFieldName(),
          SizedBox(height: 10),
          _textFieldDescripcionProducto(),
          SizedBox(height: 10),
          Positioned(
              bottom: 10.0,
              right: 20.0,
              child: FloatingActionButton.extended(
                  onPressed: ()=>_getMap2(),
                  label: Text("Verificar Lugar")
              )
          )
        ],
      ),
      bottomNavigationBar: _buttonCreate(),
    );
  }

  void _getMap2() async{
    final String googleMapsUrl="https://www.google.com/maps/search/?api=1&query=${_control.lat},${_control.long}";
    final String encodedURl = Uri.encodeFull(googleMapsUrl);
    print(encodedURl);
    if(await canLaunch(encodedURl)!=null){
      await launch(encodedURl);
    }else{
      if(await canLaunch(encodedURl)){
        await launch(
            encodedURl,
            forceWebView: true,
            forceSafariVC: true
        );
      }else{
        throw 'no puede wen viewer $encodedURl';
      }
      throw "No puede abrir el mapa";
    }
  }

  Widget _buttonCreate() {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: ElevatedButton(
        onPressed: (){_control.createSolicitud();},
        child: Text('Crear Solicitud'),
        style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2)
      ),
      child: TextField(
        maxLines: 1,
        decoration: InputDecoration(
            hintText: (_control.user!.name?? '') + (_control.user!.last_name??''),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: Colors.black,
              fontStyle:FontStyle.italic,
              fontSize: 20
            ),
            prefixIcon: Icon(
              Icons.verified_user,
              color: Colors.black,
            )
        ),
      ),
    );
  }

  Widget _textFieldDescripcionProducto() {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        border:Border.all(width: 2)
      ),
      child: TextField(
        maxLength: 255,
        maxLines: 3,
        controller: _control.descriptionController,
        decoration: InputDecoration(
            hintText: 'Descripcion del producto',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
              fontStyle: FontStyle.italic
            ),
            prefixIcon: Icon(
              Icons.description,
              color: Colors.black.withOpacity(0.6),
            )
        ),
      ),
    );
  }
/*
  Widget _textFieldPrice() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColor.passitiveColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _control.priceController,
        keyboardType: TextInputType.phone,
        maxLength: 180,
        decoration: InputDecoration(
            hintText: 'Precio del producto',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: MyColor.primaryColorDark
            ),
            prefixIcon: Icon(
              Icons.monetization_on,
              color: MyColor.primaryColor,
            )
        ),
      ),
    );
  }
*/
  void refresh(){
    setState(() {

    });
  }
}