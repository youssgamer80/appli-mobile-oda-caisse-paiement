import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:oda_cagnotte/components/CustomDialog.dart';
import 'package:oda_cagnotte/components/appb.dart';
import 'package:oda_cagnotte/components/bannerCard.dart';
import 'package:oda_cagnotte/components/card.dart';
import 'package:oda_cagnotte/components/motifscreen.dart';
import 'package:oda_cagnotte/components/payement_bottom_sheet.dart';
import 'package:oda_cagnotte/screens/academicien_list_view.dart';
import 'package:oda_cagnotte/screens/addAcademiciens.dart';
import 'package:oda_cagnotte/screens/addMotif.dart';
import 'package:oda_cagnotte/screens/motif.dart';
import 'package:oda_cagnotte/screens/payement_list_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 42.0),
            child: Appb(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 3),
              BannerCard(),
              SizedBox(height: 3),
              Center(
                child: Column(
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     showAdaptiveActionSheet(
                    //       context: context,
                    //       androidBorderRadius: 30,
                    //       actions: <BottomSheetAction>[
                    //         BottomSheetAction(
                    //             title: const Text('Liste des Academiciens',
                    //                 style: TextStyle(
                    //                     fontSize: 13, fontFamily: 'Poppins')),
                    //             onPressed: () {
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AcademicienListView()));
                    //             }),
                    //         BottomSheetAction(
                    //             title: const Text('Créer un Academiciens',
                    //                 style: TextStyle(
                    //                     fontSize: 13, fontFamily: 'Poppins')),
                    //             onPressed: () {
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (context) =>
                    //                       AcademicienBottomSheet()));
                    //             }),
                    //       ],
                    //       cancelAction: CancelAction(
                    //           title: const Text('retour',
                    //               style: TextStyle(
                    //                   fontSize: 13,
                    //                   fontFamily:
                    //                       'Poppins'))), // onPressed parameter is optional by default will dismiss the ActionSheet
                    //     );

                    //     // showDialog(
                    //     //   context: context,
                    //     //   builder: (BuildContext context) => CustomDialog(
                    //     //     title: "",
                    //     //     description: "",
                    //     //     buttonText: "Okay",
                    //     //   ),
                    //     // );
                    //   },
                    //   child: CardMenu(
                    //       image: 'assets/images/college.png',
                    //       text: 'Academiciens'),
                    // ),
                    GestureDetector(
                      onTap: () {
                        showAdaptiveActionSheet(
                          context: context,
                          androidBorderRadius: 30,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                                title: const Text('Liste des Motifs',
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: 'Poppins')),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MotifScreen()));
                                }),
                            BottomSheetAction(
                                title: const Text('Créer un Motifs',
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: 'Poppins')),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MotifPage();
                                      },
                                    ),
                                  );
                                }),
                          ],
                          cancelAction: CancelAction(
                              title: const Text('retour',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily:
                                          'Poppins'))), // onPressed parameter is optional by default will dismiss the ActionSheet
                        );
                      },
                      child: CardMenu(
                          image: 'assets/images/flash-card.png',
                          text: 'Motifs'),
                    ),
                    GestureDetector(
                      onTap: () {
                        showAdaptiveActionSheet(
                          context: context,
                          androidBorderRadius: 30,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                                title: const Text('Liste des Paiements',
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: 'Poppins')),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => PayementListView(),
                                    ),
                                  );
                                }),
                            BottomSheetAction(
                                title: const Text('Effectué un Paiement',
                                    style: TextStyle(
                                        fontSize: 13, fontFamily: 'Poppins')),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PayementBottomSheet()));
                                }),
                          ],
                          cancelAction: CancelAction(
                              title: const Text('retour',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily:
                                          'Poppins'))), // onPressed parameter is optional by default will dismiss the ActionSheet
                        );
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) => CustomDialog(
                        //     title: "",
                        //     description: "",
                        //     buttonText: "Okay",
                        //   ),
                        // );
                      },
                      child: CardMenu(
                          image: 'assets/images/dash.png', text: 'Paiements'),
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
