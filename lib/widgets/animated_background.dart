
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> 
  with TickerProviderStateMixin
{

  late AnimationController controllerA;
  late AnimationController controllerB;
  late Animation<double> posicionA;
  late Animation<double> posicionB;
  @override
  void initState() {
    super.initState();
    controllerA = AnimationController(
      vsync: this, duration: Duration(seconds: 2)
    );
    controllerB = AnimationController(
      vsync: this, duration: Duration(seconds: 4)
    );

    posicionA = Tween<double>(
      begin: -1.0, end: 1.0
    ).animate(controllerA);

    posicionB = Tween<double>(
      begin: -1.0, end: 1.0
    ).animate(controllerB);


    controllerA.addStatusListener((status) {
      if (status == AnimationStatus.completed)controllerB.forward();
      if (status == AnimationStatus.dismissed) controllerB.reverse();
    });

    controllerB.addStatusListener((status) {
      if (status == AnimationStatus.completed) controllerA.reverse();
      if (status == AnimationStatus.dismissed) controllerA.forward();
    });

    controllerA.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    return AnimatedBuilder(
      animation: Listenable.merge([
        controllerA, controllerB
      ]),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.green
      ),
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          alignment: Alignment(
            posicionA.value,
            posicionB.value,
          ),
          child: child
        );
      },
    );

  }

  @override
  void dispose() {
    controllerA.dispose();
    super.dispose();
  }

}