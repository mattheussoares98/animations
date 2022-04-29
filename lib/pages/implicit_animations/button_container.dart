import 'package:flutter/material.dart';

class ButtonContainer extends StatefulWidget {
  const ButtonContainer({Key? key}) : super(key: key);

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  bool _isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isAnimated = !_isAnimated;
            });
          },
          child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              width: _isAnimated ? MediaQuery.of(context).size.width * 0.9 : 50,
              height:
                  _isAnimated ? MediaQuery.of(context).size.height * 0.7 : 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              duration: const Duration(seconds: 1),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                      opacity: _isAnimated ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Text(
                        'Mensagem',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isAnimated ? 0 : 1,
                      child: const Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _isAnimated = !_isAnimated;
            });
          },
          child: const Icon(Icons.change_circle),
        ),
      ),
    );
  }
}
