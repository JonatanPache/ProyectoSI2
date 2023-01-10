import 'dart:convert';

SolicitudSiniestro solicitudSiniestroFromJson(String str) => SolicitudSiniestro.fromJson(json.decode(str));

String solicitudSiniestroToJson(SolicitudSiniestro data) => json.encode(data.toJson());

class SolicitudSiniestro {
  SolicitudSiniestro({
    required this.description,
    required this.date_solicitud,
    required this.cliente_id,
    required this.latitude,
    required this.longitude,
    this.status,
    this.id
  }

  );
  String? id='0';
  String description;
  String date_solicitud;
  String cliente_id;
  String latitude;
  String longitude;
  String? status='new';

  factory SolicitudSiniestro.fromJson(Map<String, dynamic> json) => SolicitudSiniestro(
    id: json['id'] is int ? json['id'].toString():json['id'],
    description: json["description"] == null ? null : json["description"],
    date_solicitud: json["date_solicitud"] == null ? null : json["date_solicitud"],
    cliente_id: json["cliente_id"] is int ? json['cliente_id'].toString() : json["cliente_id"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    status: json["status"] == null ? '' : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id":id== null ? '0' : id,
    "description": description == null ? null : description,
    "date_solicitud": date_solicitud == null ? null : date_solicitud,
    "cliente_id": cliente_id == null ? null : cliente_id,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "status": status == null ? '' : status
  };
}
