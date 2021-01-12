import 'package:codr/profile.dart';
import 'package:codr/settings.dart';
import 'generalAppBar.dart';
import 'main.dart';
import 'package:flutter/material.dart';

import 'grid.dart';
import 'newPost.dart';
import 'notifications.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Widget> pageViews;
  List<Widget> visiblePageViews;
  PageController pageController;

  void animateToOne() {
    pageController.animateToPage(
      0,
      curve: Curves.easeIn,
      duration: Duration(seconds: 1),
    );
  }

  void jumpAnimateEight() async {
    pageController.jumpToPage(6);
    await pageController.animateToPage(
      7,
      curve: Curves.easeIn,
      duration: Duration(seconds: 1),
    );
  }

  void refreshChildren(Duration duration) {
    setState(() {
      visiblePageViews = createPageContents();
    });
  }

  void swapChildren(int pageCurrent, int pageTarget) {
    List<Widget> newVisiblePageViews = [];
    newVisiblePageViews.addAll(pageViews);

    if (pageTarget > pageCurrent) {
      newVisiblePageViews[pageCurrent + 1] = visiblePageViews[pageTarget];
    } else if (pageTarget < pageCurrent) {
      newVisiblePageViews[pageCurrent - 1] = visiblePageViews[pageTarget];
    }

    setState(() {
      visiblePageViews = newVisiblePageViews;
    });
  }

  Future quickJump(int pageCurrent, int pageTarget) async {
    int quickJumpTarget;

    if (pageTarget > pageCurrent) {
      quickJumpTarget = pageCurrent + 1;
    } else if (pageTarget < pageCurrent) {
      quickJumpTarget = pageCurrent - 1;
    }
    await pageController.animateToPage(
      quickJumpTarget,
      curve: Curves.ease,
      duration: Duration(milliseconds: 200),
    );
    pageController.jumpToPage(pageTarget);
  }

  void flashToEight(int target) async {
    int pageCurrent = pageController.page.round();
    int pageTarget = target;
    if (pageCurrent == pageTarget) {
      return;
    }
    swapChildren(pageCurrent, pageTarget);
    await quickJump(pageCurrent, pageTarget);
    WidgetsBinding.instance.addPostFrameCallback(refreshChildren);
  }

  List<Widget> createPageContents() {
    return <Widget>[
      Grid(),
      Notifications(),
      Container(),
      Profile(),
      Settings(),
    ];
  }

  @override
  void initState() {
    pageController = PageController();
    pageViews = createPageContents();
    visiblePageViews = createPageContents();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void pageSet(int x) {
    bottomKey.currentState.setState(() {
      navigationBar.onTap(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: GAppBar(),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          ...visiblePageViews,
        ],
        // onPageChanged: pageSet,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColorLight,
        ),
        child: BottomNavigationBar(
          key: bottomKey,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0x6634ffc8),
          unselectedFontSize: 0,
          selectedFontSize: 0,
          backgroundColor: Theme.of(context).primaryColorLight,
          onTap: (int i) {
            bodyIndex = i;
            setState(() {
              flashToEight(i);
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Theme.of(context).buttonColor,
                  ),
                  child: NewPost(),
                ),
              ),
              label: 'New Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: bodyIndex,
          selectedItemColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
