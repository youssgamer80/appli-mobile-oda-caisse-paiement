import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oda_cagnotte/components/buttons.dart';
import 'package:oda_cagnotte/components/custom_app_bar.dart';
import 'package:oda_cagnotte/components/custom_text_field.dart';
import 'package:oda_cagnotte/components/divider.dart';
import 'package:oda_cagnotte/components/text_styles.dart';
import 'package:oda_cagnotte/helpers/app_constant.dart';
import 'package:oda_cagnotte/models/academiciens.dart';
import 'package:oda_cagnotte/services/api.dart';

class AcademicienBottomSheet extends StatefulWidget {
  const AcademicienBottomSheet({Key? key}) : super(key: key);

  @override
  _AcademicienBottomSheetState createState() => _AcademicienBottomSheetState();
}

class _AcademicienBottomSheetState extends State<AcademicienBottomSheet> {
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String cat_id = "";
  XFile? _pickedFile;
  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 140,
        title: Text("Ajouter un academicien",
            style: TextStyle(fontFamily: "Poppins")),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [Color(0xFFD1831D), Color(0xFFEBAF50)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 7,
              ),

              SizedBox(
                height: 7,
              ),

              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: _pickedFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            File(_pickedFile!.path),
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FadeInImage.assetNetwork(
                            placeholder: AppConstants.placeholder,
                            image: "",
                            // image: Get.find<AuthController>()
                            //     .getShopper!
                            //     .user!
                            //     .image
                            //     .toString(),
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            imageErrorBuilder: (c, o, s) => Image.asset(
                                AppConstants.placeholder,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  hintText: "nom",
                  controller: _nomController,
                  onChanged: (text) {},
                  onSubmit: () {},
                  fillColor: AppConstants.scaffoldBackground,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  hintText: "prenoms",
                  controller: _descriptionController,
                  onChanged: (text) {},
                  onSubmit: () {},
                  fillColor: AppConstants.scaffoldBackground,
                  keyboardType: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  hintText: "Matricule",
                  controller: _prixController,
                  onChanged: (text) {},
                  onSubmit: () {},
                  fillColor: AppConstants.scaffoldBackground,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   child: Container(
              //     width: double.infinity,
              //     height: 60,
              //     decoration: BoxDecoration(
              //         color: Color(0xFFe9eaec),
              //         borderRadius: BorderRadius.circular(5)),
              //     child: TextField(
              //       cursorColor: Color(0xFF000000),
              //       onChanged: (text) async {},
              //       autofocus: false,
              //       decoration: InputDecoration(
              //         contentPadding: EdgeInsets.all(12),
              //         hintText: "Prix",
              //         hintStyle: AppStyles.hintnormalText12(context),
              //         // suffixIcon: Icon(Icons.price_check,
              //         //     color: Theme.of(context).primaryColorDark),
              //         border: InputBorder.none,
              //       ),
              //     ),
              //   ),
              // ),

              // SizedBox(
              //   height: 100,
              // ),
              Row(
                children: [
                  AppButton(
                    text: "Enregistrer",
                    type: AppButtonType.Primary,
                    onPressed: () {
                      Academicien aca = Academicien(
                          matricule: _prixController.text,
                          prenoms: _descriptionController.text,
                          nom: _nomController.text,
                          photo: "");
                      createAcademicien(aca, _pickedFile as XFile, context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
