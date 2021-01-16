// Themes
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Screens
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2F2F2F),
        accentColor: Color(0xFF34ffc8),
        primaryColorLight: Color(0xFF373737),
        buttonColor: Color(0xff5A43BC),
        fontFamily: 'Muli',

      ),
      home: UserState(),
    );
  }
}
