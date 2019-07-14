import 'package:flutter/material.dart';

class MyAppBottomNavigator extends StatefulWidget {
  final ValueChanged<int> _onTap;

  MyAppBottomNavigator(this._onTap);

  @override
  State<StatefulWidget> createState() {
    return _MyAppBottomNavigatorState();
  }
}

class _MyAppBottomNavigatorState extends State<MyAppBottomNavigator> {
  int _currentIndex = 0;

  static const _barItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.archive), title: Text("Archive")),
    BottomNavigationBarItem(
        icon: Icon(Icons.description), title: Text("Description"))
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemTapped,
      currentIndex: _currentIndex,
      items: _barItems,
    );
  }

  void onItemTapped(int index) {
    _currentIndex = index;
    widget._onTap(_currentIndex);
  }
}
