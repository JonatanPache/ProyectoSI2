import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:seguro_motors_final/src/models/response_api.dart';
import 'package:seguro_motors_final/src/models/solicitud_siniestro.dart';
import 'package:seguro_motors_final/src/models/user.dart';
import 'package:seguro_motors_final/src/utils/my_snakbar.dart';

class ApiService{
  late String token;

  ApiService(String token){
    this.token=token;
  }

  final String baseUrl='http://192.168.0.15:8000/api/';
  //final String baseUrl='http://10.0.2.2:8000/api/';
  //final String baseUrl='http://ec2-54-163-29-100.compute-1.amazonaws.com/api/';

  /*Future<List<Poliza>> fetchPolizas() async {
    http.Response response = await http.get(Uri.parse(baseUrl+'categories'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:'Baerer $token'
      },
    );
    List categories = jsonDecode(response.body);
    print(response.body);
    return categories.map((category) => Poliza.fromJson(category)).toList();
  }*/
/*
  Future<Category> addCategory(String name) async {
    String uri = baseUrl+'categories';
    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({'name': name})
    );
    if(response.statusCode!=201){
      throw Exception('Error en created category api');
    }
    return Category.fromJson(jsonDecode(response.body));
  }

  Future<Category> updateCategory(Category category) async {
    String uri =
        baseUrl+'categories/' + category.id.toString();
    http.Response response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({'name': category.name})
    );
    if(response.statusCode!=200){
      throw Exception('Error en update category api');
    }
    return Category.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteCategory(id) async {
    String uri =
        baseUrl+'categories/' + id.toString();
    http.Response response = await http.delete(Uri.parse(uri),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:'Bearer $token'
      },
    );
    if(response.statusCode!=204){
      throw Exception('Error en delete  category');
    }
  }

  Future<String> register(String name, String email, String password,
      String passwordConfirm, String device_name) async {
    String uri = baseUrl+'auth/register';
    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: jsonEncode({
          'name': name,
          'email':email,
          'password':password,
          'password_confirmation':passwordConfirm,
          'device_name':device_name
        })
    );
    if(response.statusCode==422){
      Map<String,dynamic> body=jsonDecode(response.body);
      Map<String,dynamic> errors=body['errors'];
      String errorMessage='';
      errors.forEach((key, value) {
        value.forEach((element){
          errorMessage+=element+'\n';
        });
      });
      throw Exception(errorMessage);
    }
    return response.body;
  }
*/
  Future<ResponseApi> login(String email, String password, String device_name) async {
    String uri = baseUrl+'auth/login';
    print('3 Respuesta esperar login api services'+ device_name + password+email);
    var response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        },
        body: jsonEncode({
          'email':email,
          'password':password,
          'device_name':device_name
        })
    );
    Map<String,dynamic> body1=jsonDecode(response.body);
    print('3 Respuesta after api service login: $body1');
    if(response.statusCode==404){
      Map<String,dynamic> body=jsonDecode(response.body);
      Map<String,dynamic> errors=body['errors'];
      String errorMessage='';
      errors.forEach((key, value) {
        value.forEach((element){
          errorMessage+=element+'\n';
        });
      });
      throw Exception(errorMessage);
    }
    final data=jsonDecode(response.body);
    final data_token=body1['data'];
    print('api services-login: antes token ');
    print(data_token['remember_token']);
    this.token=data_token['remember_token'];
    print(this.token);
    ResponseApi responseApi = ResponseApi.fromJson(data);
    return responseApi;
  }

  Future<void> updateNotificationToken(String? tokenNotification) async {
    String uri =
        baseUrl+'auth/updateNotificationToken';
    print('bareer token :');
    print(this.token);
    print('Token Notif: '+tokenNotification!);
    final response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({'notification_token': tokenNotification})
    );
    final data = json.decode(response.body);
    ResponseApi res=ResponseApi.fromJson(data);
    print('respuesta despues de actualizar token');
    print(res);
    if(response.statusCode!=200){
      throw Exception('Error en actualizar token notification');
    }
    //return jsonDecode(response);
  }

  Future<ResponseApi> createSiniestro(SolicitudSiniestro solicitud) async {
    String uri =
        baseUrl+'auth/siniestro/solicitud/create';
    print('bareer token :');
    print(this.token);
    print('Token Notif: ');
    print(solicitud.toJson());
    final response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({
          'description':solicitud.description,
          'date_solicitud':solicitud.date_solicitud,
          'cliente_id':solicitud.cliente_id,
          'latitude':solicitud.latitude,
          'longitude':solicitud.longitude
        })
    );
    final data = json.decode(response.body);
    ResponseApi res=ResponseApi.fromJson(data);
    print('respuesta despues de crear solicitud siniestro');
    print(res.toJson());
    if(response.statusCode!=200){
      throw Exception('Error al crear la solicitud siniestro');
    }
    return res;
  }

  Future<ResponseApi> getSolicitudesNoConfirm(String cliente_id) async {
    String uri =
        baseUrl+'auth/siniestro/solicitud/list';
    print('bareer token :');
    print(this.token);
    print('cliente_id: '+cliente_id);
    final response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({
          'cliente_id':cliente_id,
        })
    );
    final data = json.decode(response.body);
    ResponseApi res=ResponseApi.fromJson(data);
    print('respuesta despues getSolicitudes');
    print(res.toJson());
    if(response.statusCode!=200){
      throw Exception('Error al crear la solicitud siniestro');
    }
    return res;
  }

  Future<ResponseApi> getServicesNoConfirm(String empleado_id) async {
    String uri =
        baseUrl+'auth/service/solicitud/list';
    print('bareer token :');
    print(this.token);
    print('empleado_id: '+empleado_id);
    final response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({
          'empleado_id':empleado_id,
        })
    );
    final data = json.decode(response.body);
    ResponseApi res=ResponseApi.fromJson(data);
    print('respuesta despues getServices');
    print(res.toJson());
    if(response.statusCode!=200){
      throw Exception('Error al obtener services empleado');
    }
    return res;
  }

  Future<ResponseApi> getServicesAll(String empleado_id) async {
    String uri =
        baseUrl+'auth/service/solicitud/list/all';
    print('bareer token :');
    print(this.token);
    print('empleado_id: '+empleado_id);
    final response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader:'Bearer $token'
        },
        body: jsonEncode({
          'empleado_id':empleado_id,
        })
    );
    final data = json.decode(response.body);
    ResponseApi res=ResponseApi.fromJson(data);
    print('respuesta despues getServices');
    print(res.toJson());
    if(response.statusCode!=200){
      throw Exception('Error al obtener services empleado');
    }
    return res;
  }


}