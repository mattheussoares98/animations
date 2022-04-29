import 'package:flutter/material.dart';

class ContainerTweenGrowth extends StatefulWidget {
  const ContainerTweenGrowth({Key? key}) : super(key: key);

  @override
  State<ContainerTweenGrowth> createState() => _ContainerTweenGrowthState();
}

//tween = interpolação
//é possível criar animação pra qualquer widget usando esse tween

class _ContainerTweenGrowthState extends State<ContainerTweenGrowth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1100),
            duration: const Duration(seconds: 4),
            builder: (BuildContext context, double size, Widget? child) {
              return Container(
                height: size,
                width: size,
                color: Colors.black,
              );
            }),
      ),
    );
  }
}
