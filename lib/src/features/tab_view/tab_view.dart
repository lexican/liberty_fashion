import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/core/constants/constants.dart' as constants;
import 'package:liberty_fashion/src/core/services/analytics_service/analytics_service.dart';
import 'package:liberty_fashion/src/core/services/locator/locator.dart';
import 'package:liberty_fashion/src/core/utils/utils.dart';
import 'package:liberty_fashion/src/features/home/home.dart';


class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with RouteAware {
  final _analytics = locator<AnalyticsServiceImpl>();
  int _currentTabIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    Container(),
    Container()
  ];

  void _setCurrentTabIndex(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentTabIndex),
      bottomNavigationBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: "Gallery"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
          ],
          currentIndex: _currentTabIndex,
          selectedItemColor: primaryColor,
          onTap: _setCurrentTabIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }

  void _sendCurrentTabToAnalytics() async {
    int currentIndex = _currentTabIndex;
    String screenName = '';
    String screenClassOverride = '';
    switch (currentIndex) {
      case 0:
        screenName = constants.home;
        screenClassOverride = constants.homeClassOverride;
        break;
      case 1:
        screenName = constants.gallery;
        screenClassOverride = constants.galleryClassOverride;
        break;
      case 2:
        screenName = constants.profile;
        screenClassOverride = constants.profileClassOverried;
        break;
      default:
        break;
    }
    _analytics.setCurrentScreen(
        screenName: screenName, screenClassOverride: screenClassOverride);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _analytics.firebaseAnalyticsObserver
        .subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    _analytics.firebaseAnalyticsObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    super.didPush();
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _sendCurrentTabToAnalytics();
  }
}
