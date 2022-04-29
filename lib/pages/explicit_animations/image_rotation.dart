import 'package:flutter/material.dart';

class ImageRotation extends StatefulWidget {
  const ImageRotation({Key? key}) : super(key: key);

  @override
  State<ImageRotation> createState() => _ImageRotationState();
}

class _ImageRotationState extends State<ImageRotation>
    with SingleTickerProviderStateMixin {
  //sem esse mixin, não funciona a animação
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      // reverseDuration: const Duration(seconds: 1), //tempo que vai demorar pra executar o reverse()
    );
  }

  @override
  void dispose() {
    _animationController!.dispose(); //sempre coloque antes do super.dispose()
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: RotationTransition(
              alignment: Alignment.center,
              turns: _animationController!, //controlador da animação
              child: Image.asset('lib/assets/images/logo.png'),
            ),
          ),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              _animationController!
                  .repeat(); //rotaciona infinitamente no sentido horário

              // _animationController!.reverse(); //rotaciona no sentido anti-horário até parar

              // _animationController!.stop(); //para a execução

              // _animationController!.repeat(
              //   reverse: true,
              // ); //fica executando o repeat e depois o reverse.
              //Completa uma volta no sentido horário e depois completa
              //outra no sentido anti-horário infinitamente

              // _animationController!.reverse(
              //   from:
              //       1, //não sei pra que serve esse número, coloquei qualquer valor
              // ); //executa a rotação ao contrário
            },
            child: const Text('Rotacionar'),
          ),
        ],
      ),
    );
  }
}
