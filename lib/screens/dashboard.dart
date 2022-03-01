import 'package:flutter/material.dart';
import 'package:oda_cagnotte/components/DashboardHome.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardHome(),
    );
  }
}
