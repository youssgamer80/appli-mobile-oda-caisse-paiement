import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;
import 'package:oda_cagnotte/components/minicard.dart';
import 'package:oda_cagnotte/models/academiciens.dart';
import 'package:oda_cagnotte/models/counts.dart';

import '../services/api.dart';

class BannerCard extends StatelessWidget {
  BannerCard({
    Key? key,
  }) : super(key: key);

  // final Future<String> counter = countAcademicien();
  // final Future<String> count_motif = countMotif();
  // final Future<String> count_pay = countPay();
  late Future<Count> counter = getCounts();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 10,
      height: size.height * 0.3,
      margin: EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Color(0xFFFF9C40)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Solde total de la cagnote",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Row(
                //     children: [
                //       Text(
                //         "ODA CAGNOTTE",
                //         style: TextStyle(
                //           color: Color(0xFF000000),
                //           fontSize: 25,
                //           fontWeight: FontWeight.bold,
                //           fontFamily: 'Poppins',
                //         ),
                //       ),
                //       Image.asset("assets/images/im2.png",
                //           height: size.height * 0.1),
                //     ],
                //   ),
                // ),
                Align(
                  alignment: Alignment.topLeft,
                  child: FutureBuilder<Count>(
                      future: counter,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            '${snapshot.data!.solde} FCFA',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return SizedBox(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            height: 15.0,
                            width: 15.0,
                          );
                        }
                      }),
                ),
                Spacer(),
                Image.asset("assets/images/dash.png", height: 75),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                MiniCard(
                  text: 'Academiciens',
                  child: FutureBuilder<Count>(
                      future: counter,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return customText(
                              text: '${snapshot.data!.nbreAcademicien}');
                        } else {
                          return SizedBox(
                            child: CircularProgressIndicator(
                              color: Color(0xFFEC8E4F),
                            ),
                            height: 15.0,
                            width: 15.0,
                          );
                          ;
                        }
                      }),
                ),
                MiniCard(
                  text: 'Motifs',
                  child: FutureBuilder<Count>(
                      future: counter,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return customText(
                              text: '${snapshot.data!.nbreMotif}');
                        } else {
                          return SizedBox(
                            child: CircularProgressIndicator(
                              color: Color(0xFFEC8E4F),
                            ),
                            height: 15.0,
                            width: 15.0,
                          );
                        }
                      }),
                ),
                MiniCard(
                  text: 'Paiements',
                  child: FutureBuilder<Count>(
                      future: counter,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return customText(
                              text: '${snapshot.data!.nbrePayement}');
                        } else {
                          return SizedBox(
                            child: CircularProgressIndicator(
                              color: Color(0xFFEC8E4F),
                            ),
                            height: 15.0,
                            width: 15.0,
                          );
                        }
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class customText extends StatelessWidget {
  const customText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xFFBE6F14),
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Poppins'),
    );
  }
}
