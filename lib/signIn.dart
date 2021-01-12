import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'signUp.dart';

String username;
String password;
User userID;

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
          elevation: 0, backgroundColor: Theme.of(context).primaryColorLight),
      body: Padding(
        padding: const EdgeInsets.only(right: 40.0, left: 40, bottom: 80),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Codr",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 70,
                    fontFamily: 'AdobeClean')),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'NotoSans',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).primaryColor,
                    ),
                    height: 55,
                    child: Center(
                        child: GrayTextField("Username or Email", Colors.white,
                            false, 55, username)),
                  ),
                  SizedBox(height: 15),
                  GrayTextField("Password", Colors.white, true, 55, password)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {},
                ),
                Text("Keep me signed in",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'NotoSans')),
              ],
            ),
            Container(
              child: RawMaterialButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: username, password: password);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Theme.of(context).accentColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).accentColor,
                              spreadRadius: 0.000001,
                              blurRadius: 15,
                              offset: Offset(0, 10))
                        ]),
                    height: 48,
                    child: Center(
                      child: Text("Sign In",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Theme.of(context).primaryColor,
                    ),
                    height: 3,
                    width: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    "Or Sign In With",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'NotoSans'),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Theme.of(context).primaryColor,
                    ),
                    height: 3,
                    width: 100),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInOption(Icons.ac_unit, Theme.of(context).primaryColor, 1),
                SignInOption(Icons.format_align_justify_outlined,
                    Theme.of(context).primaryColor, 2),
                SignInOption(
                    Icons.mark_chat_read, Theme.of(context).primaryColor, 3),
                SignInOption(
                    Icons.access_alarms, Theme.of(context).primaryColor, 4),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New User?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'NotoSans')),
                SizedBox(width: 15),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUp();
                        },
                      ),
                    );
                  },
                  child: Text("Create an Account",
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontSize: 17,
                          fontFamily: 'NotoSans')),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class SignInOption extends StatelessWidget {
  final Color signColor;
  final IconData signIcon;
  final int platformMethod;
  SignInOption(this.signIcon, this.signColor, this.platformMethod);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: signColor,
      ),
      child: IconButton(
        icon: Icon(signIcon),
        color: Theme.of(context).accentColor,
        onPressed: () async {
          switch (platformMethod) {
            case 1:
              {
                userID = await signInWithGoogle(context);
                print(userID);
              }
              break;
            case 2:
              {
                userID = await signInWithFacebook(context);
                print(userID);
              }
              break;
            case 3:
              {
                userID = await signInWithGitHub(context);
                print(userID);
              }
              break;
            case 4:
              // {
              //   UserCredential userCredential =
              //       await SignInWithApple().whenComplete(() {
              //     Navigator.pop(context);
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return MainScreen();
              //         },
              //       ),
              //     );
              //   });
              // }
              break;
          }
        },
      ),
    );
  }
}

class GrayTextField extends StatelessWidget {
  final String theText;
  final bool obs;
  final Color txtColor;
  final double heig;
  String input;
  GrayTextField(this.theText, this.txtColor, this.obs, this.heig, this.input);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
      ),
      height: heig,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: TextFormField(
            onChanged: (value) {
              input = value;
              print(input);
            },
            obscureText: obs,
            style: TextStyle(color: txtColor, fontFamily: 'NotoSans'),
            decoration: InputDecoration(
              hintStyle: TextStyle(color: txtColor, fontFamily: 'NotoSans'),
              hintText: theText,
              filled: false,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
