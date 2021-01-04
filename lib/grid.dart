import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                                          height: 200,

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("Example Proj.",
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 40)),
                  ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text("This is an example project, it looks pretty cool and is an example of javascript I think. Not totally sure what this project is about. But its cool. I’m running out of things to say now.",
                          style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20)),
                              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("12K Likes   140 Shares",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20)),
                      Icon(
                        Icons.bluetooth,
                        color: Theme.of(context).accentColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
