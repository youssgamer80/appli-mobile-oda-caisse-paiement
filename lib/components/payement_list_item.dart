import 'dart:io';

import 'package:flutter/material.dart';

class PayementListItem extends StatefulWidget {
  var listAcademicien;
  // var salonId;

  PayementListItem(this.listAcademicien);

  @override
  _PayementListItem createState() => _PayementListItem();
}

class _PayementListItem extends State<PayementListItem> {
  @override
  void initState() {
    super.initState();
  }

  void bookapointment() {
    print('CALLBACK: _onDaySelected');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dynamic screenHeight = MediaQuery.of(context).size.height;
    dynamic screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(top: 10.0, bottom: 130),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.listAcademicien.length,
        itemBuilder: (_, index) => Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFD3D1D1),
                  blurRadius: 35.0,
                  offset: const Offset(0.0, 1.0),
                ),
              ],
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 12, top: 5),
                  height: 55,
                  width: 55,
                  alignment: Alignment.topLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/users.png",
                      image: widget.listAcademicien[index].photo,
                      // image: Get.find<AuthController>()
                      //     .getShopper!
                      //     .user!
                      //     .image
                      //     .toString(),
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (c, o, s) => Image.asset(
                          "assets/images/users.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nom : " +
                          widget.listAcademicien[index].nom +
                          "\nPrenoms : " +
                          widget.listAcademicien[index].prenoms,
                      style: TextStyle(
                        color: Color(0xFF333232),
                        fontSize: 15.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Matricule : " + widget.listAcademicien[index].matricule,
                      style: TextStyle(
                        color: Color(0xFF777676),
                        fontSize: 11,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.delete_forever_outlined),
                  color: Color(0xFFF0895A),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Expanded(
                          child: AlertDialog(
                            title: Text('Oda Cagnotte'),
                            content: Text('Voulez-vous supprimer ?'),
                            actions: [
                              FlatButton(
                                textColor: Colors.black,
                                onPressed: () {},
                                child: Text('Retour'),
                              ),
                              FlatButton(
                                textColor: Colors.black,
                                onPressed: () {},
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void openBottomSheetforOrderType() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Container(
                height: 50,
                margin: EdgeInsets.only(top: 30, left: 15, bottom: 20),
                // height: screenHeight,

                color: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: 1,
                ),
                // You can wrap this Column with Padding of 8.0 for better design
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[]),
              );
            },
          );
        });
  }
}
