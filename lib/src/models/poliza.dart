// To parse this JSON data, do
//
//     final poliza = polizaFromJson(jsonString);

import 'dart:convert';

Poliza polizaFromJson(String str) => Poliza.fromJson(json.decode(str));

String polizaToJson(Poliza data) => json.encode(data.toJson());

class Poliza {
  Poliza({
    this.id,
    this.detalle,
    this.user_id,
    this.cotizacion_id,
    this.date_end,
    this.date_start,
    this.duracion
  });

  String? id;
  String? detalle;
  String? user_id;
  String? cotizacion_id;
  String? duracion;
  String? date_start;
  String? date_end;

  factory Poliza.fromJson(Map<String, dynamic> json) => Poliza(
    id: json["id"] == null ? '' : json["id"],
    detalle: json["name"] == null ? '' : json["name"],
    user_id: json["fecha"] == null ? '' : json["fecha"],
    cotizacion_id: json["cotizacion_id"] == null ? '' : json["cotizacion_id"],
    duracion: json["duracion"] == null ? '' : json["duracion"],
    date_start: json["date_start"] == null ? '' : json["date_start"],
    date_end: json["date_end"] == null ? '' : json["date_end"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? '' : id,
    "detalle": detalle == null ? '' : detalle,
    "user_id": user_id == null ? '' : user_id,
    "cotizacion_id": cotizacion_id == null ? '' : cotizacion_id,
    "duracion": duracion == null ? '' : duracion,
    "date_start": date_start == null ? '' : date_start,
    "date_end": date_end == null ? '' : date_end,
  };
}
