import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'commonContainer.dart';
import 'newPost.dart';
import 'signIn.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
      child: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonContainer(
                Theme.of(context).primaryColorLight,
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 28.0, right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            image: NetworkImage(
                                                'https://img1.wsimg.com/isteam/ip/5975e783-3e11-4bcf-8c45-320a644aca44/circle-cropped%20(4).png/:/cr=t:0%25,l:0%25,w:100%25,h:100%25/rs=w:1023,cg:true/rs=w:600px,m,cg:true'))),
                                  )),
                            ),
                          ),
                          Text(
                            userID.displayName,
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 28.0, right: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.person,
                                    color: Colors.transparent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: CommonContainer(
                                              Theme.of(context).primaryColor,
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Favorite Language: ",
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                          fontSize: 20),
                                                    ),
                                                    FaIcon(
                                                      FontAwesomeIcons.java,
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    CommonContainer(
                                      Theme.of(context).primaryColor,
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          "A Robotics Developer with interest in JVM, CPP and more.",
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontSize: 20),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 40),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                  left: 8.0,
                                  right: 28.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Theme.of(context).buttonColor,
                                ),
                                child: NewPost(),
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonContainer(
                Theme.of(context).primaryColorLight,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Text("FOLLOWERS",
                          style:
                              TextStyle(color: Theme.of(context).accentColor)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 20, top: 20),
                          child: CommonContainer(
                              Theme.of(context).primaryColor,
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://thispersondoesnotexist.com/image')),
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(.0),
                          child: CommonContainer(
                              Theme.of(context).primaryColor,
                              Container(
                                  height: 40,
                                  width: 40,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: new NetworkImage('https://thispersondoesnotexist.com/image?1')),

                                  )
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(.0),
                          child: CommonContainer(
                              Theme.of(context).primaryColor,
                              Container(
                                height: 40,
                                width: 40,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: new NetworkImage('https://thispersondoesnotexist.com/image?2')),

                                  )
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: CommonContainer(
                              Theme.of(context).primaryColor,
                              Container(
                                height: 40,
                                width: 40,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: new NetworkImage('https://thispersondoesnotexist.com/image?4')),

                                  )
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CommonContainer(
                Theme.of(context).primaryColorLight,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Text("PROJECTS",
                          style:
                              TextStyle(color: Theme.of(context).accentColor)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CommonContainer(
                              Theme.of(context).primaryColor,
                              Container(
                                height: 88,
                                width: 88,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(image: new NetworkImage('https://source.unsplash.com/88x88/?hacker')),
                                  )
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CommonContainer(
                                Theme.of(context).primaryColor,
                                Container(
                                  height: 88,
                                  width: 88,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(image: new NetworkImage('https://source.unsplash.com/88x88/?hacker1'),
                                      fit: BoxFit.fill),
                                    )
                                ))),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CommonContainer(
                              Theme.of(context).primaryColor,
                              Container(
                                  height: 88,
                                  width: 88,
                                  child: Center(
                                      child: Text("+134",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .accentColor))))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
