import 'package:family_gathering/reusables_and_constatnts/constants.dart';
import 'package:family_gathering/screens/home_screen.dart';
import 'package:family_gathering/screens/manage_screen.dart';
import 'package:family_gathering/screens/profile_screen.dart';
import 'package:family_gathering/screens/settings_screen.dart';
import 'package:family_gathering/views/bottom_nav_bar_view.dart';
import 'package:flutter/material.dart';

class StartingFamilyGatheringApp extends StatefulWidget {
  const StartingFamilyGatheringApp({super.key});

  @override
  State<StartingFamilyGatheringApp> createState() =>
      _StartingFamilyGatheringAppState();
}

class _StartingFamilyGatheringAppState
    extends State<StartingFamilyGatheringApp> {
  int _selectedIndex = 0;

  final List<Widget> _bottomNavigationBarPages = const [
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
          canvasColor: backgroundColor,
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
