// To parse this JSON data, do
//
//     final team = teamFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'matches_history.dart';

class TeamModel {
  TeamModel({
     this.id,
     this.area,
     this.name,
     this.shortName,
     this.tla,
     this.crestUrl,
     this.address,
     this.phone,
     this.website,
     this.email,
     this.founded,
     this.clubColors,
     this.venue,
     this.lastUpdated,
  });

  int? id;
  Area? area;
  String? name;
  String? shortName;
  String? tla;
  String? crestUrl;
  String? address;
  String? phone;
  String? website;
  String? email;
  int? founded;
  String? clubColors;
  String? venue;

  DateTime? lastUpdated;



  factory TeamModel.fromJson(String str) => TeamModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamModel.fromMap(Map<String, dynamic> json) => TeamModel(
    id: json["id"] == null ? null : json["id"],
    area: json["area"] == null ? null : Area.fromMap(json["area"]),

    name: json["name"] == null ? null : json["name"],
    shortName: json["shortName"] == null ? null : json["shortName"],
    tla: json["tla"] == null ? null : json["tla"],
    crestUrl: json["crestUrl"] == null ? null : json["crestUrl"],
    address: json["address"] == null ? null : json["address"],
    phone: json["phone"] == null ? null : json["phone"],
    website: json["website"] == null ? null : json["website"],
    email: json["email"] == null ? null : json["email"],
    founded: json["founded"] == null ? null : json["founded"],
    clubColors: json["clubColors"] == null ? null : json["clubColors"],
    venue: json["venue"] == null ? null : json["venue"],
    lastUpdated: json["lastUpdated"] == null ? null : DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "area": area == null ? null : area?.toMap(),
     "name": name == null ? null : name,
    "shortName": shortName == null ? null : shortName,
    "tla": tla == null ? null : tla,
    "crestUrl": crestUrl == null ? null : crestUrl,
    "address": address == null ? null : address,
    "phone": phone == null ? null : phone,
    "website": website == null ? null : website,
    "email": email == null ? null : email,
    "founded": founded == null ? null : founded,
    "clubColors": clubColors == null ? null : clubColors,
    "venue": venue == null ? null : venue,
    "lastUpdated": lastUpdated == null ? null : lastUpdated?.toIso8601String(),
  };
}
