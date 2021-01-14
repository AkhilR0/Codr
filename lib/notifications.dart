import 'package:flutter/material.dart';

import 'commonContainer.dart';

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
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      spreadRadius: -4)
                ],
                color: Theme.of(context).primaryColorLight,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  CommonContainer(
                        Theme.of(context).primaryColor,
                        Container(
                            height: 40,
                            width: 40,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://thispersondoesnotexist.com/image?4')),
                            ))),
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
