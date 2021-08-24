import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyIconBoton extends StatelessWidget {
  const MyIconBoton({
    required this.icon,
    required this.text,
    this.backColor = Colors.blue,
    this.ancho = 100,
    this.alto = 45,
  });

  final Widget icon;
  final String text;
  final Color backColor;
  final double? ancho;
  final double? alto;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.alto,
      width: this.ancho,
      decoration: BoxDecoration(
        color: this.backColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 6),
            blurRadius: 12
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          this.icon,
          Text(this.text, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
        ],
      ),
    );
  }
}

MyIconBoton faceBoton({double? ancho})=>MyIconBoton(
  icon: FaIcon(FontAwesomeIcons.facebook),
  text: 'Facebook',
  backColor: Colors.white,
  ancho: ancho,
);

MyIconBoton googleBoton({double? ancho})=> MyIconBoton(
  icon: FaIcon(FontAwesomeIcons.google),
  text: 'Google',
  backColor: Colors.white,
  ancho: ancho,
);
