import 'dart:convert';

class Motif {
  Motif({
    required this.id,
    required this.motif,
    required this.date,
  });

  int id;
  String motif;
  DateTime date;

  factory Motif.fromJson(Map<String, dynamic> json) => Motif(
        id: json["id"],
        motif: json["motif"],
        date: DateTime.parse(json["date"]),
      );
}
