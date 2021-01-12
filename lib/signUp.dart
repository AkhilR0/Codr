import 'package:flutter/material.dart';
import 'signIn.dart';

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
                      "First Name", Colors.white, false, 55, firstName),
                  SizedBox(height: 15),
                  GrayTextField("Last Name", Colors.white, false, 55, lastName),
                  SizedBox(height: 15),
                  GrayTextField(
                      "Username or Email", Colors.white, false, 55, username),
                  SizedBox(height: 15),
                  GrayTextField("Password", Colors.white, true, 55, password),
                ],
              ),
            ),
            Container(
              child: RawMaterialButton(
                  onPressed: () {},
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
