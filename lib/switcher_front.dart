import 'package:flutter/material.dart';
import 'package:unight_ui/event_item.dart';

class SwitcherFront extends StatelessWidget {
  const SwitcherFront({
    Key key,
    @required this.onTap,
    @required this.h,
    @required this.w,
    @required this.isDay,
    @required this.angleRev,
    @required this.angle,
  }) : super(key: key);

  final Function onTap;
  final double h;
  final double w;
  final bool isDay;
  final Animation<double> angleRev;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: h * 0.75 - (h * 0.13 / 2),
      left: w * 0.08,
      child: GestureDetector(
        onTap: onTap,
        child: Transform.rotate(
          angle: isDay ? -angleRev.value : -angle.value,
          child: Container(
            width: w * 0.84,
            height: h * 0.13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0.0, 10),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                EventItem(
                  title: 'Day events',
                  subtitle: 'THERE\'S NOTHING TO HIDE',
                ),
                Container(
                  width: 1,
                  color: Colors.black12,
                ),
                EventItem(
                  title: 'Night events',
                  subtitle: 'UNDER COVER OF DARKNESS',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
