import 'package:codr/pageAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:flutter/material.dart';
import 'signIn.dart';

Future<User> signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  final User user = userCredential.user;
  // Check if user properly signed in
  if (user != null && !user.isAnonymous && await user.getIdToken() != null) {
    final User currentUser = FirebaseAuth.instance.currentUser;
    if (user.uid == currentUser.uid) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ),
      );
      // If so, return the user details
      return user;
    }
  }
  // Otherwise, return nothing
  return null;
}

Future<User> signInWithFacebook(BuildContext context) async {
  // Trigger the sign-in flow
  final result = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final FacebookAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(result.token);

  // Once signed in, return the UserCredential
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  final User user = userCredential.user;
  // Check if user properly signed in
  if (user != null && !user.isAnonymous && await user.getIdToken() != null) {
    final User currentUser = FirebaseAuth.instance.currentUser;
    if (user.uid == currentUser.uid) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ),
      );
      // If so, return the user details
      return user;
    }
  }
  // Otherwise, return nothing
  return null;
}

Future<User> signInWithGitHub(BuildContext context) async {
  // Create a GitHubSignIn instance
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: '4a836508491be57dc97a',
      clientSecret: 'fa5abfc307702d50027982de0623fe2f9b22f76b',
      redirectUrl: 'https://codr-abb74.firebaseapp.com/__/auth/handler');

  // Trigger the sign-in flow
  final result = await gitHubSignIn.signIn(context);

  // Create a credential from the access token
  final AuthCredential githubAuthCredential =
      GithubAuthProvider.credential(result.token);

  // Once signed in, return the UserCredential
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);

  final User user = userCredential.user;
  // Check if user properly signed in
  if (user != null && !user.isAnonymous && await user.getIdToken() != null) {
    final User currentUser = FirebaseAuth.instance.currentUser;
    if (user.uid == currentUser.uid) {
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ),
      );
      // If so, return the user details
      return user;
    }
  }
  // Otherwise, return nothing
  return null;
}

class UserState extends StatefulWidget {
  @override
  _UserStateState createState() => _UserStateState();
}

class _UserStateState extends State<UserState> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return MainScreen();
    } else {
      return SignIn();
    }
  }
}
