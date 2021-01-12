import 'package:flutter/material.dart';
import 'signIn.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      childAspectRatio: (163 / 120),
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: <Widget>[
        Block(
            Icon(Icons.edit, color: Theme.of(context).accentColor),
            Text("Me", style: TextStyle(color: Theme.of(context).accentColor)),
            Text(userID.displayName,
                style: TextStyle(color: Theme.of(context).accentColor))),
        Block(
            Icon(Icons.bug_report, color: Theme.of(context).accentColor),
            Text("Bug Report",
                style: TextStyle(color: Theme.of(context).accentColor)),
            Text("Send a report",
                style: TextStyle(color: Theme.of(context).accentColor))),
        Block(
            Icon(Icons.notifications, color: Theme.of(context).accentColor),
            Text("Notifications",
                style: TextStyle(color: Theme.of(context).accentColor)),
            Text("All",
                style: TextStyle(color: Theme.of(context).accentColor))),
        Block(
            Icon(Icons.settings, color: Theme.of(context).accentColor),
            Text("General",
                style: TextStyle(color: Theme.of(context).accentColor)),
            Text("Alerts, Interests...",
                style: TextStyle(color: Theme.of(context).accentColor))),
        Block(
            Icon(Icons.person, color: Theme.of(context).accentColor),
            Text("Account",
                style: TextStyle(color: Theme.of(context).accentColor)),
            Text("johndoe@gmail.com",
                style: TextStyle(color: Theme.of(context).accentColor))),
        Block(
            Icon(Icons.lock, color: Theme.of(context).accentColor),
            Text("Privacy",
                style: TextStyle(color: Theme.of(context).accentColor)),
            Text("Only Me",
                style: TextStyle(color: Theme.of(context).accentColor))),
        Block(
            Icon(Icons.block, color: Theme.of(context).accentColor),
            Text("Block",
                style: TextStyle(color: Theme.of(context).accentColor)),
            Text("None",
                style: TextStyle(color: Theme.of(context).accentColor))),
        Block(
            Icon(Icons.help, color: Theme.of(context).accentColor),
            Text("Help",
                style: TextStyle(color: Theme.of(context).accentColor)),
            Text("Questions?",
                style: TextStyle(color: Theme.of(context).accentColor)))
      ],
    );
  }
}

class Block extends StatelessWidget {
  Icon icon;
  Text text;
  Text desc;
  Block(this.icon, this.text, this.desc);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, bottom: 30.0, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: icon,
            ),
            text,
            desc
          ],
        ),
      ),
    );
  }
}
