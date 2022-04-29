import 'package:flutter/material.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with TickerProviderStateMixin {
  //sem esse mixin, não funciona a inicialização dele no initState
  //com o mixin SingleTickerProviderStateMixin só da pra inicializar um AnimationController
  AnimationController? _animationRotateController;
  AnimationController? _animationScaleController;
  AnimationController? _animationTranslateController;
  Animation? _animationRotate;
  Animation? _animationScale;
  Animation? _animationTranslate;

  @override
  void initState() {
    super.initState();
    _animationRotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationTranslateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animationRotate = Tween<double>(
      begin: 0.0,
      end: 6.28,
    ).animate(_animationRotateController!);

    _animationScale = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(_animationScaleController!);

    _animationTranslate = Tween<Offset>(
      //o Offset é uma posição. O primeiro número é a posição do eixo X e o segundo número é a posição do eixo Y
      begin: const Offset(0, 0),
      end: const Offset(40, 40),
    ).animate(_animationTranslateController!);
  }

  @override
  void dispose() {
    _animationTranslateController!.dispose();
    _animationRotateController!.dispose();
    _animationScaleController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              if (_animationRotateController!.isAnimating) {
                _animationRotateController!.reverse();
              } else {
                _animationRotateController!.repeat();
              }
            },
            child: SizedBox(
              height: 150,
              width: 150,
              child: AnimatedBuilder(
                animation: _animationRotate!,
                child: Image.asset(
                  'lib/assets/images/logo.png',
                ), //é possível definir o widget no builder mas é melhor aqui por questão de otimização
                builder: (context, widget) {
                  return Transform.rotate(
                    angle: _animationRotate!.value,
                    child: widget,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              if (_animationScaleController!.status ==
                  AnimationStatus.completed) {
                _animationScaleController!.reverse();
              } else {
                _animationScaleController!.forward();
              }
            },
            child: SizedBox(
              height: 200,
              width: 200,
              child: AnimatedBuilder(
                animation: _animationScale!,
                child: Image.asset(
                    'lib/assets/images/logo.png'), //é possível definir o widget no builder mas é melhor aqui por questão de otimização
                builder: (context, widget) {
                  return Transform.scale(
                    scale: _animationScale!.value,
                    child: widget,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              if (_animationTranslateController!.status ==
                  AnimationStatus.completed) {
                _animationTranslateController!.reverse();
              } else {
                _animationTranslateController!.forward();
              }
            },
            child: SizedBox(
              height: 200,
              width: 200,
              child: AnimatedBuilder(
                animation: _animationTranslate!,
                child: Image.asset(
                    'lib/assets/images/logo.png'), //é possível definir o widget no builder mas é melhor aqui por questão de otimização
                builder: (context, widget) {
                  return Transform.translate(
                    offset: _animationTranslate!.value,
                    child: widget,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
