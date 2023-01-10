import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) =>
    json.encode(data.toJson());

class ResponseApi {

  String message;
  bool success;
  dynamic data;

  ResponseApi({
    required this.message,
    required this.success,
    required this.data
  });

  factory ResponseApi.fromJson(Map<String, dynamic> json){
    return ResponseApi(
        message: json["message"]==null?'':json['message'],
        success: json["success"]==null?false:json['success'],
        data: json['data']==null?'':json['data']
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "data": data,
  };
}
