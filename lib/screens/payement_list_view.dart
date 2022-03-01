import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:oda_cagnotte/components/payement_bottom_sheet.dart';
import 'package:oda_cagnotte/components/payement_list_item.dart';
import 'package:oda_cagnotte/components/custom_app_bar.dart';
import 'package:oda_cagnotte/services/api.dart';

class PayementListView extends StatefulWidget {
  const PayementListView({Key? key}) : super(key: key);

  @override
  _PayementListViewState createState() => _PayementListViewState();
}

class _PayementListViewState extends State<PayementListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Caisse",
        isBackButtonExist: true,
      ),
      backgroundColor: Color(0xffF4F7FC),
      body: SafeArea(
        child: FutureBuilder(
            future: allPaiement(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return PayementListItem(snapShot.data);
              } else {
                return Center(
                  child: LoadingBouncingGrid.circle(
                    backgroundColor: Color(0xFFFFA618),
                  ),
                );
              }
            }),
      ),
      //specify the location of the FAB
    );
  }
}
