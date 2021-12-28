import 'dart:math';

import 'package:flutter/material.dart';

class ArrowViewCenterRight extends StatelessWidget {
  const ArrowViewCenterRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 2,
      child: ClipPath(
        clipper: _ArrowClipper(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.redAccent, Colors.red],
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 5),
            ],
          ),
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}

class _ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset _center = size.center(Offset.zero);
    Path _path = Path()
      ..lineTo(_center.dx, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(_center.dx, size.height / 4);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
