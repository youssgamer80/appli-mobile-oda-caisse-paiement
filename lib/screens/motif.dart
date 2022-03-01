
// void main() => runApp(MaterialApp(
//       title: "Hospital Management",
//       home: MyApp(),
//     ));

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _mySelection;

//   final String url = "http://webmyls.com/php/getdata.php";

//   List data = List(); //edited line

//   Future<String> getSWData() async {
//     var res = await http
//         .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//     var resBody = json.decode(res.body);

//     setState(() {
//       data = resBody;
//     });

//     print(resBody);

//     return "Sucess";
//   }

//   @override
//   void initState() {
//     super.initState();
//     this.getSWData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         title: Text("Hospital Management"),
//       ),
//       body: new Center(
//         child: new DropdownButton(
//           items: data.map((item) {
//             return new DropdownMenuItem(
//               child: new Text(item['item_name']),
//               value: item['id'].toString(),
//             );
//           }).toList(),
//           onChanged: (newVal) {
//             setState(() {
//               _mySelection = newVal;
//             });
//           },
//           value: _mySelection,
//         ),
//       ),
//     );
//   }
// }

// items: motifs.map((Motif item) {
//         // ignore: unnecessary_new
//         return DropdownMenuItem<String>(
//           value: item.id.toString(), // value: motifs.id
//           child: Text(item.label), // Text(motifs.label)
//         );
//       }).toList(),
//       isExpanded: true,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "selectionner un motif ";
//         }
//         return null;
//       },
//       onChanged: (value) {
//         _motif = value.toString();
//       },
    
    // FutureBuilder<String>(
    //               future: future,
    //               builder: (context, snapShot) {
    //                 if (snapShot.hasData) {
    //                   return DropdownButton(
    //                     hint: Text("Selectionner un motif"),
    //                     isExpanded: true,
    //                     items: motifs.map((Motif item) {
    //                       // ignore: unnecessary_new
    //                       return DropdownMenuItem<String>(
    //                         value: item.id.toString(), // value: motifs.id
    //                         child: Text(item.motif), // Text(motifs.label)
    //                       );
    //                     }).toList(),
                        
    //                     onChanged: (value) {
    //                       _mySelection = value.toString();
    //                     },
    //                   );
    //                 } else {
    //                   return Center(
    //                     child: LoadingBouncingGrid.circle(
    //                       backgroundColor: Color(0xFFFFA618),
    //                     ),
    //                   );
    //                 }
    //               }),