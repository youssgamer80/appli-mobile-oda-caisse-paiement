import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:oda_cagnotte/components/motifscreen.dart';
import 'package:oda_cagnotte/helpers/app_constant.dart';
import 'package:oda_cagnotte/models/academiciens.dart';
import 'package:oda_cagnotte/models/counts.dart';
import 'package:oda_cagnotte/models/motif.dart';
import 'package:oda_cagnotte/models/paiement.dart';
import 'package:oda_cagnotte/screens/academicien_list_view.dart';

Future<List<Academicien>> allPaiement() async {
  List<Academicien> _list = [];
  final http.Response response = await http.get(
    Uri.parse(AppConstants.URL_BASE + "/all-payement/"),
    headers: <String, String>{
      'Content-Type': 'application/json;charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);

    Iterable it = data['content'];
    _list = it.map((e) => Academicien.fromJson(e)).toList();
    return _list;
  } else {
    throw new Exception('Erreur de chargement des données');
  }
}

Future<List<Academicien>> allAcademicien() async {
  List<Academicien> _list = [];
  final http.Response response = await http.get(
    Uri.parse(AppConstants.URL_BASE + "/view-all-academicien/"),
    headers: <String, String>{
      'Content-Type': 'application/json;charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);

    Iterable it = data['content'];
    _list = it.map((e) => Academicien.fromJson(e)).toList();
    return _list;
  } else {
    throw new Exception('Erreur de chargement des données');
  }
}

Future<List<Motif>> deleteMotif(String id, BuildContext context) async {
  final response = await http.delete(
      Uri.parse("https://oda-cagnotte.herokuapp.com/api/v1/deleted-motif/$id"));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return fetchMotif();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Academicien>> deleteAcademicien(String id) async {
  final response = await http.delete(Uri.parse(
      "http://oda-cagnotte.herokuapp.com/api/v1/delete-academicien/$id"));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return allAcademicien();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Motif>> fetchMotif() async {
  List<Motif> _list = [];
  final response = await http.get(
      Uri.parse("https://oda-cagnotte.herokuapp.com/api/v1/list-of-motif/"));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    Iterable it = data['content'];
    _list = it.map((e) => Motif.fromJson(e)).toList();
    return _list;
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<Count> getCounts() async {
  final http.Response response = await http.get(
    Uri.parse("https://oda-cagnotte.herokuapp.com/api/v1/counte-data-items/"),
    headers: <String, String>{
      'Content-Type': 'application/json;charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Count.fromJson(jsonDecode(response.body));
  } else {
    throw new Exception('Erreur de chargement des données');
  }
}

Future<http.StreamedResponse> createAcademicien(
  Academicien academicien,
  XFile data,
  BuildContext context,
) async {
  File _file = File(data.path);
  String fileName = _file.path.split('/').last;
  var request = http.MultipartRequest(
      'POST', Uri.parse('${AppConstants.URL_BASE}/create-academicien/'));
  request.files.add(await http.MultipartFile.fromPath('photo', _file.path,
      filename: fileName));
  // request.headers
  //     .addAll(<String, String>{'Authorization': 'Bearer ${customer.token}'});
  request.fields["nom"] = academicien.nom;
  request.fields["prenoms"] = academicien.prenoms.toString();
  request.fields["matricule"] = academicien.matricule.toString();
  // request.fields["shop_id"] = customer.shopper_id.toString();
  http.StreamedResponse response = await request.send();

  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => AcademicienListView()));
  return response;
}

Future<Null> AddMotif(
  String motif,
  BuildContext context,
) async {
  final http.Response response = await http.post(
    Uri.parse('https://oda-cagnotte.herokuapp.com/api/v1/create-new-motif/'),
    headers: <String, String>{
      'Content-Type': 'application/json;charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'motif': motif,
    }),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);

    if (data['status']) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MotifScreen()));
    } else {
      final snackBar = SnackBar(
        content: Text('${data['msg']}',
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFE27068),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Fermer',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } else {
    throw new Exception('Erreur de chargement des données');
  }
}

Future<Cagnotte> AddPayement(Cagnotte paiement, BuildContext context) async {
  var montant;
  final http.Response response = await http.post(
    Uri.parse('https://no-sir-apps.herokuapp.com/api/v1/all-payement/'),
    headers: <String, String>{
      'Content-Type': 'application/json;charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'matricule': paiement.matricule_id,
      'montant': paiement.montant,
      'motif': paiement.motif,
    }),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    if (data['status']) {
      final snackBar = SnackBar(
        content: Text('${data['msg']}',
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF8AE268),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Fermer',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return Cagnotte.fromJson(jsonDecode(response.body));
  } else {
    throw new Exception('Erreur de chargement des données');
  }
}
