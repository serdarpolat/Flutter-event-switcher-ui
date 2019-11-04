import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unight_ui/bottom_layout.dart';
import 'package:unight_ui/brand.dart';
import 'package:unight_ui/event_counter.dart';
import 'package:unight_ui/planet.dart';
import 'package:unight_ui/switcher_back.dart';
import 'package:unight_ui/switcher_front.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation colorTweenTop;
  Animation colorTweenBottom;
  Animation<double> angle;
  Animation<double> angleRev;
  Animation<double> countNight;
  Animation<double> countDay;
  Animation<double> gap;

  double get w => MediaQuery.of(context).size.width;
  double get h => MediaQuery.of(context).size.height;

  bool isDay = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    colorTweenTop =
        ColorTween(begin: Color(0xffF55294), end: Color(0xffE3509D)) //EEA65F
            .animate(controller);
    colorTweenBottom =
        ColorTween(begin: Color(0xffF5462F9), end: Color(0xffFEA83F)) //F74C95
            .animate(controller);

    angle = Tween<double>(begin: -0.08, end: 0.08).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn,
    ));

    angleRev = Tween<double>(begin: -0.08, end: 0.08).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    ));

    countNight = controller;
    countDay = controller;
    gap = controller;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: Colors.white,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                BottomLayout(h: h, w: w),
                AnimatedContainer(
                  duration: Duration(milliseconds: 10),
                  curve: Curves.bounceOut,
                  width: w,
                  height: h * 0.75 + (h * 0.015 * gap.value),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorTweenTop.value,
                        colorTweenBottom.value,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      Planet(
                        angle: 0.0,
                        top: isDay ? w * 0.4 : -w * 0.2,
                        left: isDay ? w * 0.15 : -w * 0.1,
                        width: isDay ? w * 0.08 : w * 0.55,
                        isDay: isDay,
                        screen: w,
                      ),
                      Planet(
                        angle: isDay ? 1 : 4,
                        top: isDay ? -w * 0.36 : w * 0.4,
                        left: isDay ? w * 0.5 : w * 0.9,
                        width: isDay ? w * 0.58 : w * 0.28,
                        isDay: isDay,
                        screen: w,
                      ),
                      Planet(
                        angle: 3,
                        top: isDay ? w * 0.15 : w * 0.2,
                        left: isDay ? w * 0.76 : w * 0.86,
                        width: isDay ? w * 0.03 : w * 0.03,
                        isDay: isDay,
                        screen: w,
                      ),
                      Planet(
                        angle: 4,
                        top: isDay ? w * 0.6 : w * 1.1,
                        left: isDay ? w * 0.9 : w * 0.82,
                        width: isDay ? w * 0.3 : w * 0.07,
                        isDay: isDay,
                        screen: w,
                      ),
                      Planet(
                        angle: 4,
                        top: isDay ? w * 1.2 : w * 0.9,
                        left: isDay ? w * 0.09 : -w * 0.46,
                        width: isDay ? w * 0.44 : w * 0.75,
                        isDay: isDay,
                        screen: w,
                      ),
                      Planet(
                        angle: 4,
                        top: isDay ? w * 1.20 : w * 1.05,
                        left: isDay ? w * 0.13 : w * 0.09,
                        width: isDay ? w * 0.038 : w * 0.038,
                        isDay: isDay,
                        screen: w,
                      ),
                      Brand(w: w),
                      EventCounter(
                        title: 'Night events and parties',
                        w: w,
                        left: isDay ? -w : 0,
                        count: countNight,
                      ),
                      EventCounter(
                        title: 'Day events and parties',
                        w: w,
                        left: isDay ? 0 : w,
                        count: countDay,
                      ),
                      Positioned(
                        bottom: 86,
                        left: 0,
                        child: Container(
                          width: w,
                          child: Text(
                            'So, where do you want to go?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SwitcherBack(
                  h: h,
                  w: w,
                  isDay: isDay,
                  angleRev: angleRev,
                  angle: angle,
                ),
                SwitcherFront(
                  onTap: () {
                    if (controller.status == AnimationStatus.dismissed) {
                      setState(() {
                        countDay = Tween<double>(
                          begin: 0.701,
                          end: 1.872,
                        ).animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: Curves.fastOutSlowIn,
                          ),
                        );
                        gap = Tween<double>(
                          begin: 1,
                          end: 0,
                        ).animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: Curves.bounceOut,
                          ),
                        );
                        isDay = !isDay;
                      });
                      controller.forward();
                    } else {
                      setState(() {
                        countNight = Tween<double>(
                          begin: 3.285,
                          end: 2.013,
                        ).animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: Curves.fastOutSlowIn,
                          ),
                        );
                        gap = Tween<double>(
                          begin: 0.0,
                          end: 1,
                        ).animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: Curves.bounceIn,
                          ),
                        );
                        isDay = !isDay;
                      });
                      controller.reverse();
                    }
                  },
                  h: h,
                  w: w,
                  isDay: isDay,
                  angleRev: angleRev,
                  angle: angle,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
