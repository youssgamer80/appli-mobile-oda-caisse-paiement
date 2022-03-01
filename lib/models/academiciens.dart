import 'dart:convert';

import 'package:oda_cagnotte/helpers/app_constant.dart';

class Academicien {
  final int? id;
  final String matricule;
  final String nom;
  final String photo;
  final String prenoms;

  const Academicien(
      {this.id,
      required this.matricule,
      required this.nom,
      required this.prenoms,
      required this.photo});

  factory Academicien.fromJson(Map<String, dynamic> json) {
    return Academicien(
      matricule: json['matricule'],
      photo: AppConstants.URL_BASE + "/media/" + json['photo'],
      nom: json['nom'],
      prenoms: json['prenoms'],
    );
  }
}
