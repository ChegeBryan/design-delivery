import 'package:flutter/material.dart';

class AppCourier extends StatefulWidget {
  @override
  _AppCourierState createState() => _AppCourierState();
}

class _AppCourierState extends State<AppCourier> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.markunread_mailbox_outlined),
            activeIcon: Icon(Icons.markunread_mailbox),
            label: 'New Deliveries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_wheeler_outlined),
            activeIcon: Icon(Icons.two_wheeler),
            label: 'In progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all_outlined),
            activeIcon: Icon(Icons.done_all),
            label: 'Delivered',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentTab,
      ),
    );
  }
}
