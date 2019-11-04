import 'package:flutter/material.dart';

class EventCounter extends StatelessWidget {
  const EventCounter({
    Key key,
    @required this.title,
    @required this.w,
    @required this.left,
    @required this.count,
  }) : super(key: key);

  final String title;
  final double w;
  final double left;
  final Animation<double> count;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: 220,
      left: left,
      child: Container(
        width: w,
        child: Column(
          children: <Widget>[
            Text(
              count.value > 0.0
                  ? count.value.toStringAsFixed(3)
                  : 2.106.toStringAsFixed(3),
              style: TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
