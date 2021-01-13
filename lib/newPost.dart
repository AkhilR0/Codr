import 'package:flutter/material.dart';
import 'signIn.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'hashTagsData.dart';

final GlobalKey<_TopMyButtonState> buttonKey = GlobalKey();
final GlobalKey<_TopMyTextState> button2Key = GlobalKey();
GlobalKey bottomKey = GlobalKey();
final BottomNavigationBar navigationBar = bottomKey.currentWidget;
int buttonIndex = 0;

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _chipKey = GlobalKey<ChipsInputState>();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Global';

    return IconButton(
      icon: Icon(Icons.add, color: Colors.white, size: 30),
      onPressed: () {
        buttonKey.currentState.setState(() {
          buttonIndex = 1;
        });
        button2Key.currentState.setState(() {
          buttonIndex = 1;
        });
        showBottomSheet(
          context: context,
          builder: (context) => GestureDetector(
            onVerticalDragStart: (_) {},
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Theme.of(context).accentColor),
                            hintText: "What are you programming?",
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      child: ChipsInput(
                        textStyle:
                            TextStyle(color: Theme.of(context).accentColor),
                        key: _chipKey,
                        keyboardAppearance: Brightness.light,
                        textCapitalization: TextCapitalization.words,
                        enabled: true,
                        maxChips: 5,
                        findSuggestions: (String query) {
                          if (query.isNotEmpty) {
                            var lowercaseQuery = query.toLowerCase();
                            return hashTags.where((profile) {
                              return profile.name
                                  .toLowerCase()
                                  .contains(query.toLowerCase());
                            }).toList(growable: false)
                              ..sort((a, b) => a.name
                                  .toLowerCase()
                                  .indexOf(lowercaseQuery)
                                  .compareTo(b.name
                                      .toLowerCase()
                                      .indexOf(lowercaseQuery)));
                          }
                          return hashTags;
                        },
                        chipBuilder: (context, state, profile) {
                          return InputChip(
                            key: ObjectKey(profile),
                            label: Text(
                              profile.name,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                            backgroundColor: Theme.of(context).accentColor,
                            onDeleted: () => state.deleteChip(profile),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          );
                        },
                        suggestionBuilder: (context, state, profile) {
                          return ListTile(
                            tileColor: Theme.of(context).primaryColorLight,
                            key: ObjectKey(profile),
                            title: Text(profile.name,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                            onTap: () => state.selectSuggestion(profile),
                          );
                        },
                        onChanged: (List<AppProfile> value) {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Privacy:",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              dropdownColor:
                                  Theme.of(context).primaryColorLight,
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                              underline: Container(
                                height: 2,
                                color: Theme.of(context).accentColor,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Global',
                                'Friends',
                                'Private'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: RawMaterialButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                              child:
                                  Text("Post", style: TextStyle(fontSize: 18)),
                            ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Theme.of(context).accentColor,
                            ),
                            height: 3,
                            width: 100),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Text(
                            "Share To",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Theme.of(context).accentColor,
                            ),
                            height: 3,
                            width: 100),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SignInOption(
                            Icons.ac_unit, Theme.of(context).primaryColorLight,1),
                        SignInOption(Icons.format_align_justify_outlined,
                            Theme.of(context).primaryColorLight,2),
                        SignInOption(Icons.mark_chat_read,
                            Theme.of(context).primaryColorLight,3),
                      ],
                    ),
                  ],
                ),
              ),
              constraints: BoxConstraints.expand(),
            ),
          ),
        );
      },
      padding: EdgeInsets.all(0),
    );
  }
}

class TopMyButton extends StatefulWidget {
  TopMyButton({Key key}) : super(key: key);
  @override
  _TopMyButtonState createState() => _TopMyButtonState();
}

class _TopMyButtonState extends State<TopMyButton> {
  @override
  Widget build(BuildContext context) {
    switch (buttonIndex) {
      case 0:
        {
          return IconButton(
            icon: Icon(Icons.search, size: 30),
            color: Theme.of(context).accentColor,
            onPressed: () {
              navigationBar.onTap(2);
            },
          );
        }
        break;
      case 1:
        {
          return IconButton(
            icon: Icon(Icons.close, size: 30),
            color: Theme.of(context).accentColor,
            onPressed: () {
              navigationBar.onTap(0);
              Navigator.pop(context);
              setState(() {
                buttonIndex = 0;
                button2Key.currentState.setState(() {});
              });
            },
          );
        }
        break;
    }
  }
}

class TopMyText extends StatefulWidget {
  TopMyText({Key key}) : super(key: key);
  @override
  _TopMyTextState createState() => _TopMyTextState();
}

class _TopMyTextState extends State<TopMyText> {
  @override
  Widget build(BuildContext context) {
    switch (buttonIndex) {
      case 0:
        {
          return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Codr",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontFamily: 'AdobeClean',
                  fontSize: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:4.0, bottom: 8),
                child: Image.asset('assets/logo.png', width: 50, height: 50),
              ),
            ],
          );
        }
        break;
      case 1:
        {
          return Text(
            "New Post",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 30,
            ),
          );
        }
        break;
    }
  }
}

class AppProfile {
  final String name;

  const AppProfile(
    this.name,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppProfile &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}
