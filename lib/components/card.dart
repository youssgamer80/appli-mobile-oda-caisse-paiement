import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String text;
  final String image;
  const CardMenu({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.18,
      width: size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x86BEBDBD),
            blurRadius: 30.0,
            offset: const Offset(0.0, 0.0),
          ),
        ],
        borderRadius: BorderRadius.circular(13),
        color: Color(0xFFFFFFFF),
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          Image.asset(image, height: 58),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF0B0241),
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
