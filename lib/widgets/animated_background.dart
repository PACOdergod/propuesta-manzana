
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
      vsync: this, duration: Duration(seconds: 2)
    );
    controllerHorizontal = AnimationController(
      vsync: this, duration: Duration(seconds: 4)
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
      child: Container(
        width: 50,
        height: 50,
        color: Colors.green
      ),
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              alignment: Alignment(
                posicionAV.value,
                posicionAH.value,
              ),
              child: child
            ),
          ],
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