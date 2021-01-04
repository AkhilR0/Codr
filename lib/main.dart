import 'package:codr/generalAppBar.dart';
import 'package:codr/settings.dart';
import 'package:flutter/material.dart';
import 'newPost.dart';
import 'notifications.dart';
import 'profile.dart';
import 'grid.dart';
import 'signIn.dart';
import 'signUp.dart';

void main() {
  runApp(MyApp());
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codr',
      theme: ThemeData(
        primaryColor: Color(0xFF2F2F2F),
        accentColor:  HexColor.fromHex('#34ffc8'),
        primaryColorLight: Color(0xFF373737),
        buttonColor: Color(0xff5A43BC),
        fontFamily: 'Muli',
      ),
      home: MyHomePage(),
    );
  }
}

int bodyIndex = 0;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: GAppBar(),
      body: ChangingBody(),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColorLight,
        ),
        child: BottomNavigationBar(
          key: bottomKey,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          backgroundColor: Theme.of(context).primaryColorLight,
          elevation: 0,
          onTap: (int i) {
            setState(() {
              bodyIndex = i;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Theme.of(context).buttonColor,
                  ),
                  child: NewPost(),
                ),
              ),
              label: 'New Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: bodyIndex,
          selectedItemColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

class ChangingBody extends StatefulWidget {
  @override
  _ChangingBodyState createState() => _ChangingBodyState();
}

class _ChangingBodyState extends State<ChangingBody> {
  @override
  Widget build(BuildContext context) {
    switch (bodyIndex) {
      case 0:
        {
          return Grid();
        }
        break;
      case 1:
        {
          return Notifications();
        }
        break;
      case 2:
        {
          return Container();
        }
        break;
      case 3:
        {
          return Profile();
        }
        break;
      case 4:
        {
          return Settings();
        }
        break;
    }
  }
}
