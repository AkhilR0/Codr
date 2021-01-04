import 'package:flutter/material.dart';
import 'newPost.dart';

class GAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  _GAppBarState createState() => _GAppBarState();
}

class _GAppBarState extends State<GAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      title: TopMyText(key: button2Key),
      actions: [
        TopMyButton(key: buttonKey),
      ],
    );
  }
}
