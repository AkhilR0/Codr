import 'package:flutter/material.dart';
import 'signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pageAnimation.dart';

String firstName;
String lastName;

class SignUp extends StatelessWidget {
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 18),
              child: Text("Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'NotoSans')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a user?",
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
                          return SignIn();
                        },
                      ),
                    );
                  },
                  child: Text("Sign In",
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontSize: 17,
                          fontFamily: 'NotoSans')),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Column(
                children: [
                  GrayTextField(
                      "First Name", Colors.white, false, 55, "First Name"),
                  SizedBox(height: 15),
                  GrayTextField(
                      "Last Name", Colors.white, false, 55, "Last Name"),
                  SizedBox(height: 15),
                  GrayTextField(
                      "Username or Email", Colors.white, false, 55, "Username"),
                  SizedBox(height: 15),
                  GrayTextField("Password", Colors.white, true, 55, "Password"),
                ],
              ),
            ),
            Container(
              child: RawMaterialButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                        email: username,
                        password: password,
                      );
                      userID = userCredential.user;
                      // Check if user properly signed in
                      if (userID != null &&
                          !userID.isAnonymous &&
                          await userID.getIdToken() != null) {
                        userID.updateProfile(
                            displayName: "$firstName $lastName");
                        final User currentUser =
                            FirebaseAuth.instance.currentUser;
                        if (userID.uid == currentUser.uid) {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MainScreen();
                              },
                            ),
                          );
                        }
                      }
                      // Otherwise, return nothing
                      return null;
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Theme.of(context).accentColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).accentColor,
                            offset: Offset(0, 3),
                            blurRadius: 8,
                            spreadRadius: -4)
                      ],
                    ),
                    height: 48,
                    child: Center(
                      child: Text("Sign Up",
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
          ],
        )),
      ),
    );
  }
}
