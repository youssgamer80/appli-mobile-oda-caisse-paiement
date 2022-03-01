import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:oda_cagnotte/components/buttons.dart';
import 'package:oda_cagnotte/components/custom_app_bar.dart';
import 'package:oda_cagnotte/components/custom_text_field.dart';
import 'package:oda_cagnotte/components/divider.dart';
import 'package:oda_cagnotte/components/text_styles.dart';
import 'package:oda_cagnotte/helpers/app_constant.dart';
import 'package:oda_cagnotte/models/motif.dart';
import 'package:oda_cagnotte/models/paiement.dart';
import 'package:oda_cagnotte/services/api.dart';

class PayementBottomSheet extends StatefulWidget {
  const PayementBottomSheet({Key? key}) : super(key: key);

  @override
  _PayementBottomSheetState createState() => _PayementBottomSheetState();
}

class _PayementBottomSheetState extends State<PayementBottomSheet> {
  String _mySelection = '';
  //late Future<List<Motif>> motif;
  TextEditingController _matriculeController = TextEditingController();
  bool _valid = false;
  TextEditingController _montantController = TextEditingController();
  TextEditingController _motifController = TextEditingController();
  List data = [];
  late Future<String> future;

  Future<String> getData() async {
    final response = await http.get(
        Uri.parse("https://oda-cagnotte.herokuapp.com/api/v1/list-of-motif/"));

    var resb = jsonDecode(response.body);
    setState(() {
      data = resb['content'];
    });
    return "success";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    // motif = fetchMotif();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Caisse",
        isBackButtonExist: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 7,
            ),
            Text(
              "Ajouter un paiement",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 7,
            ),
            DividerWidget(),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFECE8E8),
                      offset: const Offset(0, 0),
                      blurRadius: 33,
                      spreadRadius: 2.0)
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _matriculeController,
                decoration: InputDecoration(
                  errorText: _valid ? "champ vide" : null,
                  hintText: "Matricule",
                  border: InputBorder.none,
                  icon: Icon(Icons.drag_indicator_sharp,
                      color: Color(0xFFFFBE44)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFECE8E8),
                      offset: const Offset(0, 0),
                      blurRadius: 33,
                      spreadRadius: 2.0)
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _montantController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: _valid ? "champ vide" : null,
                  hintText: "Montant",
                  border: InputBorder.none,
                  icon: Icon(Icons.money, color: Color(0xFFFFBE44)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFECE8E8),
                      offset: const Offset(0, 0),
                      blurRadius: 33,
                      spreadRadius: 2.0)
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropDown(data),
            ),
            Container(
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  color: Color(0xFFEC9E38),
                  onPressed: () {
                    setState(() {
                      if (_matriculeController.text.isEmpty ||
                          _montantController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Le champ ne doit pas etre vide!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center),
                            backgroundColor: Color(0xFFE27068),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      } else {
                        Cagnotte payement = Cagnotte(
                          matricule_id: _matriculeController.text,
                          montant: _montantController.text,
                          motif: _motifController.text,
                        );
                        AddPayement(payement, context);
                      }
                    });
                  },
                  child: Text(
                    "Enregistrer",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget DropDown(List data) {
    if (data != null) {
      return DropdownButton(
        items: data.map((item) {
          return new DropdownMenuItem(
            child: new Text(
              item['Name'],
              style: TextStyle(fontSize: 14.0),
            ),
            value: item['ID'].toString(),
          );
        }).toList(),
        hint: Text(
          "Selectioner un motif",
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        onChanged: (newVal) {
          setState(() {
            _mySelection = newVal.toString();
          });
        },
        value: _mySelection,
      );
    } else {
      return new Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
