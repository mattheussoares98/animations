import 'package:flutter/material.dart';

class AirPlaneAnimatedContainer extends StatefulWidget {
  const AirPlaneAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<AirPlaneAnimatedContainer> createState() =>
      _AirPlaneAnimatedContainerState();
}

class _AirPlaneAnimatedContainerState extends State<AirPlaneAnimatedContainer> {
  bool _isAnimated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        height: double.infinity,
        width: double.infinity,
        color: Colors.pinkAccent,
        duration: const Duration(seconds: 1),
        padding: const EdgeInsets.only(bottom: 100),
        alignment: _isAnimated ? Alignment.topCenter : Alignment.bottomCenter,
        curve: Curves.fastLinearToSlowEaseIn,
        child: const SizedBox(
          child: Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            setState(() {
              _isAnimated = !_isAnimated;
            });
          },
          child: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
