import 'package:flutter/material.dart';
import 'package:login_tutorial/presentation/screens/bike_catalogs.dart';
import 'package:login_tutorial/presentation/screens/touristics_places.dart';
import 'package:login_tutorial/presentation/widgets/button_gradient.dart';

class PresentationApp extends StatefulWidget {
  const PresentationApp({super.key});

  @override
  State<PresentationApp> createState() => _PresentationAppState();
}

class _PresentationAppState extends State<PresentationApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _buttonsAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _logoAnimation = Tween<Offset>(begin: Offset(0, -3), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.7, curve: Curves.easeOutCubic)));

    _buttonsAnimation = Tween<Offset>(begin: Offset(0, 3), end: Offset(0, -0.5))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.3, 1.0, curve: Curves.easeOutCubic)));

    _fadeAnimation = CurvedAnimation(
        parent: _controller, curve: Interval(0.0, 0.2, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child:
                Image.asset('assets/presentation_img.png', fit: BoxFit.cover)),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SlideTransition(
              position: _logoAnimation,
              child: FadeTransition(
                  opacity: _fadeAnimation, child: logoPresentation())),
          Padding(
            padding: EdgeInsets.all(40),
            child: SlideTransition(
              position: _buttonsAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    buttonGradient('CATALOGOS', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BikeCatalogs()));
                    }, [
                      Color.fromARGB(255, 252, 61, 47),
                      Color.fromARGB(255, 210, 46, 34)
                    ]),
                    SizedBox(height: 20),
                    buttonGradient('LUGARES TURISTICOS', () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TouristicsPlaces()));
                    }, [Color(0xFF18A88E), Color.fromARGB(255, 18, 130, 110)]),
                  ],
                ),
              ),
            ),
          ),
        ])
      ],
    ));
  }

  Container logoPresentation() {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 89, 89, 89), Color(0xFF292A2B)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        width: double.infinity,
        child: Image.asset(
          'assets/logo.png',
          height: 180,
        ));
  }
}
