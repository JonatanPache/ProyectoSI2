import 'dart:convert';

ServiceSiniestro solicitudSiniestroFromJson(String str) => ServiceSiniestro.fromJson(json.decode(str));

String solicitudSiniestroToJson(ServiceSiniestro data) => json.encode(data.toJson());

class ServiceSiniestro {
  ServiceSiniestro({
    required this.solicitudSiniestroId,
    required this.observaciones,
    required this.status,
    required this.latitude,
    required this.longitude,
    required this.totalCosto,
  });

  String solicitudSiniestroId;
  String observaciones;
  String status;
  String latitude;
  String longitude;
  String totalCosto;

  factory ServiceSiniestro.fromJson(Map<String, dynamic> json) => ServiceSiniestro(
    solicitudSiniestroId: json["solicitud_siniestro_id"] is int ? json["solicitud_siniestro_id"].toString() : json["solicitud_siniestro_id"],
    observaciones: json["observaciones"] == null ? null : json["observaciones"],
    status: json["status"] == null ? null : json["status"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    totalCosto: json["total_costo"] == null ? null : json["total_costo"],
  );

  Map<String, dynamic> toJson() => {
    "solicitud_siniestro_id": solicitudSiniestroId == null ? '' : solicitudSiniestroId,
    "observaciones": observaciones == null ? null : observaciones,
    "status": status == null ? null : status,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "total_costo": totalCosto == null ? null : totalCosto,
  };
}
