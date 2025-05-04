
import 'package:flutter/material.dart';

import '../reusables_and_constatnts/constants.dart';
import '../views/bottom_nav_bar_view.dart';
import 'home_screen.dart';
import 'manage_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class StartingScreen extends StatefulWidget {
   static final String id ="/statring_screen" ;

  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() =>
      _StartingScreenState();
}

class _StartingScreenState
    extends State<StartingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _bottomNavigationBarPages =  [
    HomeScreen(),
    ManageScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Manage',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Settings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_box),
      label: 'Profile',
    ),
  ];

  void _onNavigationItemBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavigationBarPages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: KBackgroundColor,
        ),
        child: BottomNavBarView(
          bottomNavigationBarItems: _bottomNavigationBarItems,
          selectedIndex: _selectedIndex,
          onNavigationItemBarTapped: _onNavigationItemBarTapped,
        ),
      ),
    );
  }
}
