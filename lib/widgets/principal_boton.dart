import 'package:flutter/material.dart';

class PrincipalBoton extends StatelessWidget {
  const PrincipalBoton({
    required this.text,
    this.onPress,
    this.ancho,
    this.padding,
    this.autoajustar = false,
    this.borderRadius,
    this.backColor,
    this.textColor,
  });

  final String text;
  final Function? onPress;
  final double? ancho;
  final EdgeInsetsGeometry? padding;
  final bool autoajustar;
  final BorderRadiusGeometry? borderRadius;
  final Color? backColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius:this.borderRadius??BorderRadius.circular(20)
      ),
      disabledColor: Colors.grey,
      elevation: 8,
      color: this.backColor??Colors.green.shade600,

      child: Container(
        width: this.autoajustar
          ? null
          : this.ancho??MediaQuery.of(context).size.width,
        
        padding: this.padding??EdgeInsets.symmetric(vertical: 14),
        alignment: this.autoajustar
          ? null
          : Alignment.center,
          
        child: Text(this.text, style: TextStyle(
          color: this.textColor??Colors.white,
          fontSize: 18
        )),
      ),

      onPressed: (){
        FocusScope.of(context).unfocus();
        onPress;
      } 
    );
  }
}