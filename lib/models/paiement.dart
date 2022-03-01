class Cagnotte {
  final String matricule_id;
  final String montant;
  final String motif;

  const Cagnotte({
    required this.matricule_id,
    required this.montant,
    required this.motif,
  });

  factory Cagnotte.fromJson(Map<String, dynamic> json) {
    return Cagnotte(
      matricule_id: json['matricule_id'],
      montant: json['montant'],
      motif: json['motif'],
    );
  }
}
