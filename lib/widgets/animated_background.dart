import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> 
  with SingleTickerProviderStateMixin
{
  double _valor1 = .1;
  double _valor2 = .7;
  double _opacidad1 = .1;
  double _opacidad2 = .7;

  @override
  Widget build(BuildContext context) {
    return 
    TweenAnimationBuilder<double?>(
      tween: Tween(
        begin: _opacidad1,
        end: _opacidad2
      ),
      duration: Duration(seconds: 4),
      onEnd: (){
        setState(() {
          _opacidad1==_valor1
          ? _opacidad1=_valor2
          : _opacidad1=_valor1;

          _opacidad2==_valor1
          ? _opacidad2=_valor2
          : _opacidad2=_valor1;
        });
      },
      builder: (context, value, child){
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(30, 120, 30, value!),
                Color.fromRGBO(30, 120, 30, .7-value),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ), 
        );
      },
    );

  }
}