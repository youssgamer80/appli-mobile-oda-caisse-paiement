import 'package:flutter/material.dart';
import 'package:oda_cagnotte/components/NavBar.dart';
import 'package:oda_cagnotte/screens/dashboard.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => {__goToDashboard(context)});
  }

  void __goToDashboard(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(decoration: BoxDecoration(color: Colors.white)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Image(
                          image: AssetImage('assets/images/im2.png'),
                          width: 300,
                          height: 300,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "ODA cagnotte",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(height: 26),
                    Image(
                      image: AssetImage('assets/images/orangemoney.gif'),
                      height: 160,
                    ),
                  ],
                ))),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Image(
                      image: AssetImage('assets/images/load.gif'),
                      width: 40,
                      height: 40),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text(
                    "Chargement des données ... ",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
