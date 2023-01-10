import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

  final Widget mobile;
  final Widget desktop;
  const Responsive({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context)=>
      MediaQuery.of(context).size.width<768;

  static bool isDesktop(BuildContext context)=>
      MediaQuery.of(context).size.width<1200;

  @override
  Widget build(BuildContext context) {
    final Size _size=MediaQuery.of(context).size;
    if(_size.width>=1200) return desktop;
    return mobile;

  }
}
