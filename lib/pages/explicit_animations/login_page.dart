import 'dart:ui';
import 'package:animations/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.currentPage,
    Key? key,
  }) : super(key: key);
  final Pages currentPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animationWidth;
  Animation<double>? _animationBlur;
  Animation<double>? _animationOpacity;
  Animation<double>? _animationBorder;
  final Duration _animationDuration = const Duration(seconds: 3);

  OutlineInputBorder _personalizedBorder() {
    return const OutlineInputBorder(
        // borderSide: BorderSide(
        //   color: Colors.pink,
        // ),
        );
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _animationOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(
          0.4,
          1,
        ), //esse intervalo é o proporcional do tempo de animação, levando em conta que o tempo de animação é 1. Se a animação for de um segundo, vai executar a animação a partir de 0,6 do tempo de animação até 1 de animação
      ),
    );
    _animationBorder = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(
          0.8,
          1,
        ), //esse intervalo é o proporcional do tempo de animação, levando em conta que o tempo de animação é 1. Se a animação for de um segundo, vai executar a animação a partir de 0,6 do tempo de animação até 1 de animação
      ),
    );

    _animationBlur = Tween<double>(
      begin: 10,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(
          0,
          0.4,
        ), //esse intervalo é o proporcional do tempo de animação, levando em conta que o tempo de animação é 1.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _animationWidth = Tween<double>(
      begin: 0,
      end: MediaQuery.of(context).size.width,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: const Interval(
          0.4,
          0.8,
        ), //esse intervalo é o proporcional do tempo de animação, levando em conta que o tempo de animação é 1.
      ),
    ); //precisei colocar o _animationWidget aqui porque
    //executando no initState da erro, pois o mediaquery ainda não havia
    //conseguido pegar o tamanho da largura do dispositivo

    _animationController!.forward();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animationBlur!,
              builder: (context, widget) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'lib/assets/images/fundo.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      //faz um efeito de borrado
                      //ele precisa ser filho do que quer borrar. Nesse caso é filho do Container que possui a imagem
                      sigmaX: _animationBlur!.value,
                      sigmaY: _animationBlur!.value,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 10,
                          child: FadeTransition(
                            opacity: _animationOpacity!,
                            child:
                                Image.asset('lib/assets/images/detalhe1.png'),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: FadeTransition(
                            opacity: _animationOpacity!,
                            child:
                                Image.asset('lib/assets/images/detalhe2.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedBuilder(
                      animation: _animationWidth!,
                      builder: (context, widget) {
                        return SizedBox(
                          width: _animationWidth!.value,
                          child: FadeTransition(
                            opacity: _animationOpacity!,
                            child: TextField(
                              enabled: false,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                hintText: 'Usuário',
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                border: _personalizedBorder(),
                                errorBorder: _personalizedBorder(),
                                enabledBorder: _personalizedBorder(),
                                focusedBorder: _personalizedBorder(),
                                disabledBorder: _personalizedBorder(),
                                focusedErrorBorder: _personalizedBorder(),
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 8),
                  AnimatedBuilder(
                      animation: _animationWidth!,
                      builder: (context, widget) {
                        return SizedBox(
                          width: _animationWidth!.value,
                          child: FadeTransition(
                            opacity: _animationOpacity!,
                            child: TextField(
                              enabled: false,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                hintText: 'Senha',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                border: _personalizedBorder(),
                                errorBorder: _personalizedBorder(),
                                enabledBorder: _personalizedBorder(),
                                focusedBorder: _personalizedBorder(),
                                disabledBorder: _personalizedBorder(),
                                focusedErrorBorder: _personalizedBorder(),
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 10),
                  AnimatedBuilder(
                      animation: _animationWidth!,
                      builder: (context, widget) {
                        return InkWell(
                          onTap: () {
                            // Navigator.of(context).push
                          },
                          child: FadeTransition(
                            opacity: _animationOpacity!,
                            child: Container(
                              width: _animationWidth!.value,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(
                                    _animationBorder!.value),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FadeTransition(
                                    opacity: _animationOpacity!,
                                    child: const Text(
                                      'animaLdo',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  AnimatedBuilder(
                      animation: _animationOpacity!,
                      builder: (context, widget) {
                        return FadeTransition(
                          opacity: _animationOpacity!,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.pink,
                              ),
                              onPressed: () {
                                if (!_animationController!.isAnimating) {
                                  print('executando');
                                  _animationController!.repeat();

                                  Future.delayed(_animationDuration, () {
                                    _animationController!.stop();
                                  });
                                }
                              },
                              child: const Text('Animar a tela novamente')),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
