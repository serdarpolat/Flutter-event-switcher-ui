import 'package:flutter/material.dart';

class Planet extends StatelessWidget {
  const Planet({
    Key key,
    @required this.angle,
    @required this.top,
    @required this.left,
    @required this.width,
    @required this.isDay,
    @required this.screen,
  }) : super(key: key);

  final double angle;
  final double top;
  final double left;
  final double width;
  final bool isDay;
  final double screen;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: top,
      left: left,
      child: Transform.rotate(
        angle: angle,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: width,
          height: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screen * 0.5),
              gradient: LinearGradient(
                colors: isDay
                    ? [
                        Color(0xffE23286),
                        Color(0xffFEA83F),
                      ]
                    : [
                        Color(0xff3C49F9),
                        Color(0xffE23286),
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
        ),
      ),
    );
  }
}
