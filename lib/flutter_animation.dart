import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FlutterAnimation extends StatefulWidget {
  const FlutterAnimation({Key? key}) : super(key: key);

  @override
  State<FlutterAnimation> createState() => _FlutterAnimationState();
}

class _FlutterAnimationState extends State<FlutterAnimation> {

  double turn =0.0;
  List myColors = [Colors.transparent, Colors.red, Colors.green, Colors.yellow, Colors.blue,  Colors.deepOrange, Colors.deepPurple, Colors.pinkAccent, Colors.teal, Colors.cyan, Colors.deepOrangeAccent];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => setState(() {
         turn = 1.0;
        }));

    return SafeArea(
      child: Center(
        child: Transform.scale(
          scale: 1.7,
          child: Stack(
            children: List.generate(80, (index) {
              return AnimatedRotation(turns: turn*index,
                duration: Duration(minutes: 12),
              child: Row(
                  children: List.generate(3, (i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: myColors[i], width: 0.6)
                        ),
                        height: 90,
                        width: 90,

                      ),
                    );
                  }),
              ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
