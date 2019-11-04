import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Brand extends StatelessWidget {
  const Brand({
    Key key,
    @required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      left: 0,
      child: Container(
        width: w,
        child: Column(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              child: SvgPicture.asset(
                'assets/svg/drop_icon.svg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 70,
              height: 20,
              child: SvgPicture.asset(
                'assets/svg/brand.svg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
