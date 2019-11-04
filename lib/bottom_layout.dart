import 'package:flutter/material.dart';

class BottomLayout extends StatelessWidget {
  const BottomLayout({
    Key key,
    @required this.h,
    @required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: h * 0.75,
      child: Container(
        width: w,
        height: h * 0.25,
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              'CHANGE IT ANYTIME',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: w - 48,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffEF5294),
                    Color(0xff745AE7),
                  ],
                ),
              ),
              child: Text(
                'Next step',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
