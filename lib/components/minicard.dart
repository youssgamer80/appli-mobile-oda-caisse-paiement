import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final Widget child;
  final String text;
  const MiniCard({
    Key? key,
    required this.child,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.26,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x42DD8034),
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
        borderRadius: BorderRadius.circular(13),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        children: [
          SizedBox(height: 4),
          child,
          Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 11, fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
