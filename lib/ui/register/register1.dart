import 'package:cargo/ui/login_ui/login.dart';
import 'package:cargo/ui/register/register2.dart';
import 'package:cargo/ui/verification/verification.dart';
import 'package:cargo/utilitaire/border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

TextEditingController emailTextEditingController = TextEditingController();
TextEditingController passwordTextEditingController = TextEditingController();
TextEditingController nomTextEditingController = TextEditingController();
TextEditingController prenomTextEditingController = TextEditingController();
TextEditingController phoneTextEditingController = TextEditingController();

bool estMasque = false;

validateForm() {
  if (nomTextEditingController.text.length < 3) {
    Fluttertoast.showToast(msg: "Le nom doit être au moins 3 carctères");
  } else if (prenomTextEditingController.text.length < 3) {
    Fluttertoast.showToast(msg: "Le prenom doit être au moins 3 carctères");
  } else if (phoneTextEditingController.text.isEmpty) {
    Fluttertoast.showToast(msg: "Le numero de téléphone est requis");
  } else if (!emailTextEditingController.text.contains("@")) {
    Fluttertoast.showToast(msg: "Adresse email invalide");
  } else if (passwordTextEditingController.text.length < 6) {
    Fluttertoast.showToast(
        msg: "Le mot de passe doit être au moins 6 caractère");
  } else {
    BuildContext context;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Register2(
          nomTextEditingController,
          prenomTextEditingController,
          emailTextEditingController,
          passwordTextEditingController,
          phoneTextEditingController);
    }));
  }
}

class _RegisterState extends State<Register> {
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
                  _title2(),
                  _nom(),
                  _prenom(),
                  _phone(),
                  _email(),
                  _password(),
                  _RegisterButton(),
                  _signUp(),
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
        "S'incrire",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: emailTextEditingController,
          keyboardType: TextInputType.emailAddress,
          onChanged: null,
          decoration: InputDecoration(
              hintText: "Adresse Email",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _nom() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: nomTextEditingController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Nom",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _prenom() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: prenomTextEditingController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Prenom",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _phone() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: phoneTextEditingController,
          keyboardType: TextInputType.phone,
          onChanged: null,
          decoration: InputDecoration(
              hintText: "Téléphone",
              focusedBorder: border(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _password() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          obscureText: estMasque,
          controller: passwordTextEditingController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "Mot de passe",
              suffixIcon: IconButton(
                  onPressed: () {
                    print("Eye");
                  },
                  icon: IconButton(
                    onPressed: () {
                      setState(() {
                        estMasque = !estMasque;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye_sharp),
                    color: Colors.purple,
                  )),
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
              if (nomTextEditingController.text.length < 3) {
                Fluttertoast.showToast(
                    msg: "Le nom doit être au moins 3 carctères");
              } else if (prenomTextEditingController.text.length < 3) {
                Fluttertoast.showToast(
                    msg: "Le prenom doit être au moins 3 carctères");
              } else if (phoneTextEditingController.text.isEmpty) {
                Fluttertoast.showToast(
                    msg: "Le numero de téléphone est requis");
              } else if (!emailTextEditingController.text.contains("@")) {
                Fluttertoast.showToast(msg: "Adresse email invalide");
              } else if (passwordTextEditingController.text.length < 6) {
                Fluttertoast.showToast(
                    msg: "Le mot de passe doit être au moins 6 caractère");
              } else {
                
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Register2(
                      nomTextEditingController,
                      prenomTextEditingController,
                      emailTextEditingController,
                      passwordTextEditingController,
                      phoneTextEditingController);
                }));
              }
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
  }

  _signUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("J'ai un compte?"),
          InkWell(
              onTap: () => print("OK"),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: Text(
                  "Se connecter",
                  style: TextStyle(color: Colors.purple),
                ),
              ))
        ],
      ),
    );
  }

  _title2() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(
        "Créez votre compte",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.purple.shade200),
      ),
    );
  }
}
