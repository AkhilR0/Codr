import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  Widget containerChild;
  Color containerColor;
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
