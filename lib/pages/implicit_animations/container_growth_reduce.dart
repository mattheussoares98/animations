import 'package:flutter/material.dart';

class ContainerGrowthReduce extends StatefulWidget {
  const ContainerGrowthReduce({Key? key}) : super(key: key);

  @override
  State<ContainerGrowthReduce> createState() => _ContainerGrowthReduceState();
}

class _ContainerGrowthReduceState extends State<ContainerGrowthReduce> {
  bool _animated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height:
                  _animated ? MediaQuery.of(context).size.height * 0.8 : 200,
              width: _animated ? MediaQuery.of(context).size.width : 200,
              color: _animated ? Colors.purpleAccent : Colors.black,
              // curve: Curves.bounceIn, //tipo de curva da animação
              // curve: Curves.bounceInOut, //tipo de curva da animação
              // curve: Curves.bounceOut, //tipo de curva da animação
              // curve: Curves.decelerate, //tipo de curva da animação
              // curve: Curves.ease, //tipo de curva da animação
              // curve: Curves.easeIn, //tipo de curva da animação
              curve: Curves.fastOutSlowIn, //tipo de curva da animação
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _animated = !_animated;
                });
              },
              child: const Text('Alterar'),
              style: ElevatedButton.styleFrom(
                primary: _animated ? Colors.purpleAccent : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
