import 'package:cargo/ui/global/global.dart';
import 'package:cargo/ui/register/register1.dart';
import 'package:cargo/ui/spash_screen/splash_screen.dart';
import 'package:cargo/utilitaire/border.dart';
import 'package:cargo/utilitaire/validation.dart';
import 'package:cargo/widget/progress_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String inputEmail = "";
  String inputPassword = "";

  validateForm() {
      loginUser();
  }

  loginUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressPopUp("Traitement en cours. Veuillez patienter...");
        });

    final User firebaseUser = (await fAuth
            .signInWithEmailAndPassword(
                email: inputEmail.trim(),
                password: inputPassword.trim()
                )
            .catchError((msg) {
      Navigator.pop(context);

      Fluttertoast.showToast(msg: "Erreur" + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Connexion établie avec succès");

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MySplashScreen();
      }));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Erreur survenue lors de la connexion");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            width: 300,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _title(),
                _email(),
                _password(),
                _forgetPassword(),
                _loginButton(),
                _signUp(),
                // _loginGoogle()
              ],
            ),
          ),
        ));
  }

  _title() {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: Text(
        "Se Connecter",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          onChanged: (String newVal) {
            setState(() {
              inputEmail = newVal;
            });
          },
          decoration: InputDecoration(
              hintText: "Adresse Email",
              errorText: validationEmail(inputEmail),
              errorBorder: borderError(),
              focusedBorder: validationEmail(inputEmail) == null
                  ? border()
                  : borderError(),
              enabledBorder: borderEnabled()),
        ),
      ),
    );
  }

  _password() {
    return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            onChanged: (String newVal) {
              setState(() {
                inputPassword = newVal;
              });
            },
            decoration: InputDecoration(
              hintText: "Mot de passe",
              errorText: validationPassword(inputPassword),
              errorBorder: borderError(),
              focusedBorder: validationPassword(inputPassword) == null
                  ? border()
                  : borderError(),
              enabledBorder: borderEnabled(),
              suffixIcon: IconButton(
                  onPressed: () {
                    print("Eye");
                  },
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.purple,
                  )),
            ),
          ),
        ));
  }

  // _loginButton() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 50.0),
  //     child: InkWell(
  //       onTap: () {
  //         validateForm();
  //       },
  //       child: Container(
  //         alignment: Alignment.center,
  //         width: MediaQuery.of(context).size.width,
  //         height: 50,
  //         decoration: BoxDecoration(
  //             color: Colors.purple,
  //             borderRadius: BorderRadius.horizontal(
  //                 left: Radius.circular(25), right: Radius.circular(25))),
  //         child: Text(
  //           "Se connecter",
  //           style: TextStyle(
  //               color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  _loginButton() {
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
                "Se connecter",
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
      child: InkWell(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Register();
        })),
        child: Text(
          "Je n'ai pas de compte ? S'inscrire",
          style: TextStyle(color: Colors.purple),
        ),
      ),
    );
  }

  // _loginGoogle() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 25.0),
  //     child: Stack(
  //       children: [
  //         Container(
  //           alignment: Alignment.center,
  //           width: MediaQuery.of(context).size.width,
  //           height: 50,
  //           decoration: BoxDecoration(
  //               color: Colors.redAccent.shade400,
  //               borderRadius: BorderRadius.all(Radius.circular(10))),
  //           child: Text(
  //             "Se connecter avec Google",
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w700),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _forgetPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () => print("OK"),
          child: Text(
            "Mot de passe oublié?",
            style: TextStyle(
              color: Colors.purple,
            ),
          ),
        ),
      ),
    );
  }
}
