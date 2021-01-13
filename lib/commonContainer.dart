import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final Widget containerChild;
  final Color containerColor;
  CommonContainer(this.containerColor, this.containerChild);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(0, 3),
                blurRadius: 4,
                spreadRadius: -4)
          ]),
      child: containerChild,
    );
  }
}
