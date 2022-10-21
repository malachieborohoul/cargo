import 'dart:typed_data';

import 'package:cargo/ui/global/global.dart';
import 'package:cargo/ui/verification/verification.dart';
import 'package:cargo/utilitaire/border.dart';
import 'package:cargo/utilitaire/imagePicker.dart';
import 'package:cargo/utilitaire/storage_methods.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Vehicule extends StatefulWidget {
  const Vehicule({Key key}) : super(key: key);

  @override
  State<Vehicule> createState() => _VehiculeState();
}

class _VehiculeState extends State<Vehicule> {
  TextEditingController marqueTextEditingController = TextEditingController();
  TextEditingController modelTextEditingController = TextEditingController();
  TextEditingController couleurEditingController = TextEditingController();

  List<String> vehiculeTypesList = ["moto", "camion", "voiture"];
  String selectedVehiculeType;

  saveVehiculeInfo() async {
    String photoVehiculeUrl = await StorageMethods()
        .uploadImageToStorage("photoVehicule", _photoVeh, false);

    Map vehiculeInfoMap = {
      'marque': marqueTextEditingController.text.trim(),
      "model": modelTextEditingController.text.trim(),
      "couleur": couleurEditingController.text.trim(),
      "type": selectedVehiculeType,
      "photoVehiculeUrl": photoVehiculeUrl,
    };

    DatabaseReference vehiculesRef =
        FirebaseDatabase.instance.ref().child("users");
    vehiculesRef
        .child(currentFirebaseUser.uid)
        .child("details_vehicule")
        .set(vehiculeInfoMap);

    Fluttertoast.showToast(msg: "Les informations du véhicule ont été enregistrées avec succès, Félicitations.");

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Verification();
    }));
  }

  validateForm() {
    if (marqueTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Le nom de la marque est requis");
    } else if (modelTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Le nom du model est requis");
    } else if (couleurEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "La couleur est requise");
    } else if (selectedVehiculeType == null) {
      Fluttertoast.showToast(msg: "Selectionnez le type de votre véhicule");
    } else if (_photoVeh == null) {
      Fluttertoast.showToast(msg: "Selectionnez une image");
    } else {
      saveVehiculeInfo();
    }
  }

  Uint8List _photoVeh;

  void selectPhotoVehicule() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _photoVeh = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 300,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _title(),
                  _marque(),
                  _model(),
                  _couleur(),
                  _typeVehicule(),
                  _photoVehicule(),
                  _RegisterButton(),
                ],
              ),
            ),
          ),
        ));
  }

  _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Text(
        "Enregistrer votre véhicule",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _marque() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: marqueTextEditingController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Marque",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _model() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: modelTextEditingController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Model",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _couleur() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: couleurEditingController,
          keyboardType: TextInputType.phone,
          onChanged: null,
          decoration: InputDecoration(
              hintText: "CouleurModel",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _RegisterButton() {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: InkWell(
            onTap: () {
              validateForm();
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25), right: Radius.circular(25))),
              child: const Text(
                "Suivant",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            )));

    // return Padding(
    //   padding: const EdgeInsets.only(top: 18.0),
    //   child: ElevatedButton(
    //       onPressed: () {
    //         saveUserInfo();
    //       },
    //       style: ElevatedButton.styleFrom(primary: Colors.purple),
    //       child: const Text(
    //         "Terminer",
    //         style: TextStyle(color: Colors.black, fontSize: 18),
    //       )),
    // );
  }

  _photoVehicule() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child:  Text(
              "Télécharger la photo de votre véhicule",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 70,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: _photoVeh != null
                            ? MemoryImage(_photoVeh)
                            : const AssetImage(
                                'assets/images/profil.jpg',
                              ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    border: Border.all(color: Colors.grey.shade600, width: 1.0),
                  ),
                  child: IconButton(
                      onPressed: selectPhotoVehicule,
                      icon: const Icon(Icons.add_a_photo)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _typeVehicule() {
    return DropdownButton(
      dropdownColor: Colors.white24,
      hint: const Text("Choisissez le type de véhicule",
          style: TextStyle(fontSize: 14, color: Colors.grey)),
      value: selectedVehiculeType,
      onChanged: (newValue) {
        setState(() {
          selectedVehiculeType = newValue.toString();
        });
      },
      items: vehiculeTypesList.map((car) {
        return DropdownMenuItem(
            child: Text(car, style: const TextStyle(color: Colors.white)), value: car);
      }).toList(),
    );
  }
}
