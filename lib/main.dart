// Themes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Screens
import 'generalAppBar.dart';
import 'settings.dart';
import 'newPost.dart';
import 'notifications.dart';
import 'profile.dart';
import 'grid.dart';
import 'signIn.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';

int bodyIndex = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (userID == null) {
    userID = FirebaseAuth.instance.currentUser;
  }
  runApp(App());
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

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // Future.delayed(const Duration(seconds: 3), () {
          return MyApp();
          // });
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2F2F2F),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 50, height: 50),
            SizedBox(height: 20),
            CupertinoActivityIndicator(),
          ],
        )),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 50, height: 50),
            Text(
              'Something went wrong, please restart the app',
              style: TextStyle(color: Colors.red),
            )
          ],
        )),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codr',
      theme: ThemeData(
        primaryColor: Color(0xFF2F2F2F),
        accentColor: HexColor.fromHex('#34ffc8'),
        primaryColorLight: Color(0xFF373737),
        buttonColor: Color(0xff5A43BC),
        fontFamily: 'Muli',
      ),
      home: userState(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          unselectedItemColor: Color(0x6634ffc8),
          unselectedFontSize: 0,
          selectedFontSize: 0,
          backgroundColor: Theme.of(context).primaryColorLight,
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
