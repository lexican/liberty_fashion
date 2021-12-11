import 'package:flutter/material.dart';
import 'package:liberty_fashion/screens/collection_category/collection_category.dart';
import 'package:liberty_fashion/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const CollectionCategory(),
    Container(),
    Container()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SizedBox(
        height: 58,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              //title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections), label: "Gallery"
                //title: Text('Business'),
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"
                //title: Text('Profile'),
                ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black,
        ),
      ),
    );
  }
}
