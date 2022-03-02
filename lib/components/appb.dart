import 'package:flutter/material.dart';
import 'package:oda_cagnotte/components/minicard.dart';
import 'dart:convert';

class Appb extends StatelessWidget {
  const Appb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //decoration: boxde,
      width: size.width * 10,
      height: size.height * 0.3,
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Text(
            "ODA CAGNOTTE",
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          Image.asset("assets/images/im2.png", height: size.height * 0.1),
        ],
      ),
    );
  }
}
