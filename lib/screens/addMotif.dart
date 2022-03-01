import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oda_cagnotte/components/custom_app_bar.dart';
import 'package:oda_cagnotte/models/motif.dart';
import 'package:oda_cagnotte/services/api.dart';

class MotifPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MotifPage();
  }
}

class _MotifPage extends State<MotifPage> {
  late Future<Motif> _motif;
  final TextEditingController _text = TextEditingController();
  bool _valid = false;

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field
  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 140,
        title:
            Text("Ajouter un motif", style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [Color(0xFFD1831D), Color(0xFFEBAF50)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 23, vertical: 5),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 219, 223, 219),
                              offset: const Offset(0, 0),
                              blurRadius: 23,
                              spreadRadius: 2.0)
                        ],
                        color: Color.fromARGB(255, 241, 237, 237),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        children: [
                          // Image.asset("assets/images/Make it rain-cuate.png",
                          //     height: size.height * 0.5),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, bottom: 12),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 241, 228, 228),
                              offset: const Offset(0, 0),
                              blurRadius: 33,
                              spreadRadius: 2.0)
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _text,
                        decoration: InputDecoration(
                          errorText: _valid ? "champ vide" : null,
                          hintText: "Entrer un motif",
                          border: InputBorder.none,
                          icon: Icon(Icons.drag_indicator_sharp,
                              color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: size.width * 0.5,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            color: Color(0xFFDB921B),
                            onPressed: () {
                              setState(() {
                                if (_text.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Le champ ne doit pas etre vide!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                          ),
                                          textAlign: TextAlign.center),
                                      backgroundColor: Color(0xFFE27068),
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                } else {
                                  AddMotif(_text.text, context);
                                  _text.text = '';
                                }
                              });
                            },
                            child: Text("Ajouter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
