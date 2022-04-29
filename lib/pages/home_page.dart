import 'package:animations/pages/explicit_animations/animated_builder.dart';
import 'package:animations/pages/explicit_animations/image_rotation.dart';
import 'package:animations/pages/explicit_animations/login_page.dart';
import 'package:animations/pages/implicit_animations/air_plane_animated_container.dart';
import 'package:animations/pages/implicit_animations/button_container.dart';
import 'package:animations/pages/implicit_animations/image_rotation_tween.dart';
import 'package:animations/pages/implicit_animations/container_growth_reduce.dart';
import 'package:animations/pages/implicit_animations/conteiner_tween_growth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Pages {
  implicitAirplane,
  implicitAnimatedContainer,
  implicitButton,
  implicitContainerTweenGrowth,
  implicitImageRotationTween,
  explicitImageRotation,
  explicitAnimatedBuilder,
  loginPage,
}

class _HomePageState extends State<HomePage> {
  Pages _page = Pages.loginPage;

  PopupMenuItem _popupMenuItem({
    required Pages pageEnum,
    required String text,
  }) {
    return PopupMenuItem(
      key: ValueKey(pageEnum),
      child: Text(text),
      onTap: () => Future.delayed(
        const Duration(milliseconds: 100),
        () {
          setState(() {
            _page = pageEnum;
          });
        },
      ),
    );
  }

  String _appBarTitle() {
    if (_page == Pages.implicitAirplane) {
      return 'Voa voa avião';
    } else if (_page == Pages.implicitAnimatedContainer) {
      return 'Container animado';
    } else if (_page == Pages.implicitButton) {
      return 'Botão ou contato';
    } else if (_page == Pages.implicitContainerTweenGrowth) {
      return 'Container crescendo';
    } else if (_page == Pages.implicitImageRotationTween) {
      return 'Container rodando';
    } else if (_page == Pages.explicitImageRotation) {
      return 'Conteiner rodando explicitamente';
    } else if (_page == Pages.explicitAnimatedBuilder) {
      return 'Animated Builder';
    } else if (_page == Pages.loginPage) {
      return 'Login';
    } else {
      return 'Animação';
    }
  }

  Widget _currentPage() {
    if (_page == Pages.implicitAirplane) {
      return const AirPlaneAnimatedContainer();
    } else if (_page == Pages.implicitButton) {
      return const ButtonContainer();
    } else if (_page == Pages.implicitAnimatedContainer) {
      return const ContainerGrowthReduce();
    } else if (_page == Pages.implicitContainerTweenGrowth) {
      return const ContainerTweenGrowth();
    } else if (_page == Pages.implicitImageRotationTween) {
      return const ImageRotationTween();
    } else if (_page == Pages.explicitImageRotation) {
      return const ImageRotation();
    } else if (_page == Pages.explicitAnimatedBuilder) {
      return const AnimatedBuilderWidget();
    } else if (_page == Pages.explicitAnimatedBuilder) {
      return const AnimatedBuilderWidget();
    } else if (_page == Pages.loginPage) {
      return LoginPage(currentPage: _page);
    } else {
      return const AirPlaneAnimatedContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text(_appBarTitle()),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                _popupMenuItem(
                  pageEnum: Pages.implicitAirplane,
                  text: 'Avião',
                ),
                _popupMenuItem(
                  pageEnum: Pages.implicitAnimatedContainer,
                  text: 'Quadrado',
                ),
                _popupMenuItem(
                  pageEnum: Pages.implicitButton,
                  text: 'Botão',
                ),
                _popupMenuItem(
                  pageEnum: Pages.implicitContainerTweenGrowth,
                  text: 'Crescendo',
                ),
                _popupMenuItem(
                  pageEnum: Pages.implicitImageRotationTween,
                  text: 'Rodando',
                ),
                _popupMenuItem(
                  pageEnum: Pages.explicitImageRotation,
                  text: 'Rodando explicitamente',
                ),
                _popupMenuItem(
                  pageEnum: Pages.explicitAnimatedBuilder,
                  text: 'AnimatedBuilder',
                ),
                _popupMenuItem(
                  pageEnum: Pages.loginPage,
                  text: 'Login',
                ),
              ];
            },
          ),
        ],
      ),
      body: _currentPage(),
    );
  }
}
