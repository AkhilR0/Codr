import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final Widget containerChild;
  final Color containerColor;
  CommonContainer(this.containerColor, this.containerChild);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: containerColor,
      ),
      child: containerChild,
    );
  }
}
