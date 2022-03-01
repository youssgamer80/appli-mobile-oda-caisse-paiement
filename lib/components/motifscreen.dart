import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:oda_cagnotte/components/custom_app_bar.dart';
import 'package:oda_cagnotte/models/motif.dart';
import 'package:oda_cagnotte/services/api.dart';

class MotifScreen extends StatefulWidget {
  const MotifScreen({Key? key}) : super(key: key);

  @override
  _MotifScreenState createState() => _MotifScreenState();
}

class _MotifScreenState extends State<MotifScreen> {
  late Future<List<Motif>> motif;

  @override
  void initState() {
    super.initState();
    motif = fetchMotif();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Motif",
        isBackButtonExist: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<Motif>>(
          future: motif,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].motif}",
                              style: TextStyle(
                                color: Color(0xFF1F1F1F),
                                fontSize: 16.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${snapshot.data![index].date}",
                              style: TextStyle(
                                color: Color(0xFF090214),
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
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Oda Cagnotte'),
                                content: const Text('Voulez-vous supprimer ?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Non'),
                                    child: const Text('Non'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        deleteMotif(
                                            snapshot.data![index].id.toString(),
                                            context);
                                      });
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MotifScreen()));
                                    },
                                    child: const Text('Oui'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: LoadingBouncingGrid.circle(
                  backgroundColor: Color(0xFFFFA618),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
