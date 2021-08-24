
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> 
  with TickerProviderStateMixin
{
  late AnimationController controllerVertical;
  late AnimationController controllerHorizontal;
  late Animation<double> posicionAV;
  late Animation<double> posicionAH;

  @override
  void initState() {
    super.initState();
    controllerVertical = AnimationController(
      vsync: this, duration: Duration(seconds: 10)
    );
    controllerHorizontal = AnimationController(
      vsync: this, duration: Duration(seconds: 5)
    );

    posicionAV = Tween<double>(
      begin: -1.0, end: 1.0
    ).animate(controllerVertical);

    posicionAH = Tween<double>(
      begin: -1.0, end: 1.0
    ).animate(controllerHorizontal);


    controllerVertical.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        controllerHorizontal.forward();
      if (status == AnimationStatus.dismissed) 
        controllerHorizontal.reverse();
    });

    controllerHorizontal.addStatusListener((status) {
      if (status == AnimationStatus.completed) 
        controllerVertical.reverse();
      if (status == AnimationStatus.dismissed) 
        controllerVertical.forward();
    });

    controllerVertical.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    return AnimatedBuilder(
      animation: Listenable.merge([
        controllerVertical, controllerHorizontal
      ]),
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.shade100,
                Colors.green.shade600,
              ],
              begin: Alignment(
                posicionAH.value, posicionAV.value
              ),
              end:Alignment(
                0-posicionAH.value, 0-posicionAV.value
              ), 
            ),
          ),
        );
      },
    );

  }

  @override
  void dispose() {
    controllerVertical.dispose();
    controllerHorizontal.dispose();
    super.dispose();
  }

}