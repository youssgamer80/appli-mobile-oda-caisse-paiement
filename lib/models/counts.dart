// To parse this JSON data, do
//
//     final count = countFromJson(jsonString);

import 'dart:convert';

Count countFromJson(String str) => Count.fromJson(json.decode(str));

String countToJson(Count data) => json.encode(data.toJson());

class Count {
  Count({
    required this.status,
    required this.solde,
    required this.nbreAcademicien,
    required this.nbreMotif,
    required this.nbrePayement,
  });

  bool status;
  int solde;
  int nbreAcademicien;
  int nbreMotif;
  int nbrePayement;

  factory Count.fromJson(Map<String, dynamic> json) => Count(
        status: json["status"],
        solde: json["solde"],
        nbreAcademicien: json["nbre_academicien"],
        nbreMotif: json["nbre_motif"],
        nbrePayement: json["nbre_payement"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "solde": solde,
        "nbre_academicien": nbreAcademicien,
        "nbre_motif": nbreMotif,
        "nbre_payement": nbrePayement,
      };
}
