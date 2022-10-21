import 'dart:typed_data';

import 'package:cargo/ui/global/global.dart';
import 'package:cargo/ui/login_ui/login.dart';
import 'package:cargo/ui/register/register1.dart';
import 'package:cargo/ui/register/vehicule.dart';
import 'package:cargo/ui/verification/verification.dart';
import 'package:cargo/utilitaire/storage_methods.dart';
import 'package:cargo/widget/progress_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilitaire/imagePicker.dart';

class Register2 extends StatefulWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nomTextEditingController = TextEditingController();
  TextEditingController prenomTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  Register2(
      this.emailTextEditingController,
      this.nomTextEditingController,
      this.passwordTextEditingController,
      this.phoneTextEditingController,
      this.prenomTextEditingController);
  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  bool valueMale = false;
  bool valueFemale = false;
  bool choixChauffeur = false;
  String selectedSexe = "male";
  Uint8List _photoProfil;
  Uint8List _photoCNI;

  void selectPhotoProfil() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _photoProfil = im;
    });
  }

  void selectPhotoCNI() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _photoCNI = im;
    });
  }

  validateForm() {
    if (_photoProfil == null) {
      Fluttertoast.showToast(msg: "Choisissez une photo de profil");
    } else if (_photoCNI == null) {
      Fluttertoast.showToast(msg: "Choisissez la photo de votre CNI");
    } else if (selectedSexe == null) {
      Fluttertoast.showToast(msg: "Selectionnez le genre");
    } else {
      saveUserInfo();
    }
  }

  saveUserInfo() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressPopUp("Traitement en cours. Veuillez patienter...");
        });

    final User firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text.trim(),
                password: passwordTextEditingController.text.trim())
            .catchError((msg) {
      Navigator.pop(context);
      if (msg.hashCode == "firebase_auth/email-already-in-use") {
        Fluttertoast.showToast(msg: "Erreur email");
      }
      Fluttertoast.showToast(msg: "Erreur" + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      String photoProfilUrl = await StorageMethods()
          .uploadImageToStorage("photoProfil", _photoProfil, false);

      String photoCNIUrl = await StorageMethods()
          .uploadImageToStorage("photoCNI", _photoCNI, false);

      // Si le user clique sur le bouton je suis chauffeur
      if (choixChauffeur == true) {
        Map userMap = {
          "id": firebaseUser.uid,
          "nom": nomTextEditingController.text.trim(),
          "prenom": prenomTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
          "sexe": selectedSexe,
          "photoProfilUrl": photoProfilUrl,
          "photoCNIUrl": photoCNIUrl,
          "categorie": "chauffeur"
        };
        DatabaseReference chauffeurRef =
            FirebaseDatabase.instance.ref().child("users");
        chauffeurRef.child(firebaseUser.uid).set(userMap);

        currentFirebaseUser = firebaseUser;
        Fluttertoast.showToast(msg: "Compte a été créé");

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Vehicule();
        }));
      } else {
        Map userMap = {
          "id": firebaseUser.uid,
          "nom": nomTextEditingController.text.trim(),
          "prenom": prenomTextEditingController.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
          "sexe": selectedSexe,
          "photoProfilUrl": photoProfilUrl,
          "photoCNIUrl": photoCNIUrl,
          "categorie": "passager"
        };
        DatabaseReference chauffeurRef =
            FirebaseDatabase.instance.ref().child("users");
        chauffeurRef.child(firebaseUser.uid).set(userMap);

        currentFirebaseUser = firebaseUser;
        Fluttertoast.showToast(msg: "Compte a été créé");

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      }
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Compte n'a pas été créé");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _iconBack(),
                  _title(),
                  _title2(),
                  _photoProfilFun(),
                  _photoCNIFun(),
                  _genre(),
                  _switchButtonChauffeur(),
                  _Register2Button(),
                ],
              ),
            ),
          ),
        ));
  }

  _title() {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "S'INSCRIRE",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  border() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.purple, width: 1.0));
  }

  _Register2Button() {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
            onTap: () {
              validateForm();
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25), right: Radius.circular(25))),
              child: Text(
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

  _title2() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        "Nous voulons vous mieux vous connaitre",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.purple.shade200),
      ),
    );
  }

  _photoProfilFun() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Télécharger votre photo de profil",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(70)),
                    image: DecorationImage(
                        image: _photoProfil != null
                            ? MemoryImage(_photoProfil)
                            : AssetImage(
                                'assets/images/profil.jpg',
                              ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 35.0,
                ),
                child: IconButton(
                    onPressed: selectPhotoProfil,
                    icon: const Icon(Icons.add_a_photo)),
              ),
            ],
          )
        ],
      ),
    );
  }

  _photoCNIFun() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Télécharger votre photo de CNI",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Stack(
            children: [
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: _photoCNI != null
                            ? MemoryImage(_photoCNI)
                            : const AssetImage('assets/images/profil.jpg'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 15),
                child: IconButton(
                    onPressed: selectPhotoCNI,
                    icon: const Icon(Icons.add_a_photo)),
              ),
            ],
          )
        ],
      ),
    );
  }

  _genre() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Genre",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(Radius.circular(70)),
                      border: valueMale == false
                          ? Border.all(color: Colors.grey.shade600, width: 1.0)
                          : Border.all(color: Colors.purple, width: 1.0)),
                  child: InkWell(
                    onTap: (() {
                      setState(() {
                        valueMale = !valueMale;
                        if (valueFemale == true) {
                          valueFemale = false;
                          selectedSexe = "homme";
                          print(selectedSexe);
                        }
                      });
                    }),
                    child: const Icon(Icons.man),
                  ),
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(Radius.circular(70)),
                    border: valueFemale == false
                        ? Border.all(color: Colors.grey.shade600, width: 1.0)
                        : Border.all(color: Colors.purple, width: 1.0)),
                child: InkWell(
                  onTap: (() {
                    setState(() {
                      valueFemale = !valueFemale;
                      if (valueMale == true) {
                        valueMale = false;
                        selectedSexe = "femelle";
                        print(selectedSexe);
                      }
                    });
                  }),
                  child: const Icon(Icons.woman),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _dateNaissance() {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          alignment: Alignment.center,
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.purple, width: 1.5)),
          child: InkWell(
            onTap: () {
              showDatePicker(
                  context: context,
                  initialDate: DateTime(DateTime.now().year),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(DateTime.now().year));
            },
            child: const Text(
              "Selectionner votre date de naissance",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }

  _iconBack() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 290),
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_sharp)),
    );
  }

  _switchButtonChauffeur() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Je suis un chauffeur",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: FlutterSwitch(
              width: 90.0,
              height: 40.0,
              valueFontSize: 15.0,
              toggleSize: 45.0,
              value: choixChauffeur,
              borderRadius: 30.0,
              padding: 8.0,
              showOnOff: true,
              activeColor: Colors.purple,
              inactiveColor: Colors.grey,
              activeIcon: const Icon(Icons.done),
              activeText: "Oui",
              inactiveText: "Non",
              onToggle: (val) {
                setState(() {
                  choixChauffeur = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
