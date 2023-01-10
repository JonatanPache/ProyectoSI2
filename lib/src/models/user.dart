import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.ci,
    required this.last_name,
    required this.phone,
    required this.address,
    required this.birthday,
    required this.city_id,
    required this.rol_id,
    required this.gender_id,
    required this.notification_token,
    required this.remember_token
  });

  String id;
  String name;
  String email;
  String ci;
  String last_name;
  String phone;
  String address;
  String birthday;
  String city_id;
  String rol_id;
  String gender_id;
  String notification_token;
  String remember_token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] is int ? json["id"].toString() : json["id"],
    name: json["name"] == null ? '' : json["name"],
    email: json["email"] == null ? '' : json["email"],
    notification_token: json["notification_token"] == null ? '' : json["notification_token"],
    remember_token: json["remember_token"] == null ? '' : json["remember_token"],
    ci: json["ci"] == null ? '' : json["ci"],
    last_name: json["last_name"] == null ? '' : json["last_name"],
    phone: json["phone"] == null ? '' : json["phone"],
    address: json["address"] == null ? '' : json["address"],
    birthday: json["birthday"] == null ? '' : json["birthday"],
    city_id: json["city_id"] is int ? json["city_id"].toString() : json["city_id"],
    rol_id: json["rol_id"] is int ? json["rol_id"].toString() : json["rol_id"],
    gender_id: json["gender_id"] == null ? '' : json["gender_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? '' : id,
    "name": name == null ? '' : name,
    "email": email == null ? '' : email,
    "notification_token": notification_token == null ? '' : notification_token,
    "remember_token": remember_token == null ? '' : remember_token,
    "ci": ci == null ? '' : ci,
    "last_name": last_name == null ? '' : last_name,
    "phone": phone == null ? '' : phone,
    "address": address == null ? '' : address,
    "birthday": birthday == null ? '' : birthday,
    "city_id": city_id == null ? '' : city_id,
    "rol_id": rol_id == null ? '' : rol_id,
    "gender_id": gender_id == null ? '' : gender_id,
  };
}
