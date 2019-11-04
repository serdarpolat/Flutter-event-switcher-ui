import 'package:flutter/material.dart';

class SwitcherBack extends StatelessWidget {
  const SwitcherBack({
    Key key,
    @required this.h,
    @required this.w,
    @required this.isDay,
    @required this.angleRev,
    @required this.angle,
  }) : super(key: key);

  final double h;
  final double w;
  final bool isDay;
  final Animation<double> angleRev;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: h * 0.75 - (h * 0.13 / 2),
      left: w * 0.1,
      child: Transform.rotate(
        angle: isDay ? angleRev.value : angle.value,
        child: Container(
          width: w * 0.80,
          height: h * 0.13,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff6A4AD5),
                Color(0xffC358A6),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0.0, 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
