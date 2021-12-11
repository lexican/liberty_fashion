import 'package:flutter/material.dart';
import 'package:liberty_fashion/screens/collection_list.dart';
import 'package:liberty_fashion/utils/parameters.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const CollectionList(),
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
          selectedItemColor: Parameters.primaryColor,
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
