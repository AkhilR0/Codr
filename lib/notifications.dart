import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      shrinkWrap: false,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Theme.of(context).primaryColorLight,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Icon(Icons.person),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tyler J. Followed You",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20)),
                      Text("This is a comment, not too sure what I’m …",
                          style:
                              TextStyle(color: Theme.of(context).accentColor))
                    ],
                  )
                ],
              ),
              height: 100),
        );
      },
    );
  }
}
