import 'package:flutter/material.dart';

class ImageRotationTween extends StatelessWidget {
  const ImageRotationTween({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 6.28),
            duration: const Duration(seconds: 2),
            child: Image.asset(
                'lib/assets/images/logo.png'), //esse child aqui é o mesmo do builder abaixo. É melhor se colocar ele aqui, porque melhora o desempenho. Ele será carregado somente uma vez deixando como está
            builder: (BuildContext context, double angle, Widget? child) {
              return Transform.rotate(
                angle: angle,
                child: child,
              );
            }),
      ),
    );
  }
}
