import 'package:flutter/material.dart';

class ProgressPopUp extends StatelessWidget {
  String message;
  ProgressPopUp(this.message);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
              const SizedBox(
                width: 26,
              ),
              Flexible(child: Text(message, style: TextStyle(color: Colors.grey, fontSize: 12)))
            ],
          ),
        ),
      ),
    );
  }
}
