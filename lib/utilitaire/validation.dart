import 'package:flutter/material.dart';

validationEmail(String value) {
  if (value.isEmpty) return "Entrez votre adresse email";
  // return null;
  final RegExp emailExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!emailExp.hasMatch(value)) return 'Adresse email invalide';
  return null;
}

validationPassword(String value) {
  if (value.isEmpty) return "Entrez votre mot de passe";
  if (value.length < 6) return "Mot de passe est de 6 caractères au moins ";
  return null;
}
