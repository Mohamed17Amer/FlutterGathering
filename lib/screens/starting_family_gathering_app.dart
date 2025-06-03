import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/cubits/cubit/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reusables_and_constatnts/constants.dart';
import '../views/bottom_nav_bar_view.dart';
import 'home_screen.dart';
import 'manage_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class StartingScreen extends StatelessWidget {
  static final String id = "/statring_screen";
  QueryDocumentSnapshot? familyGroupMap;
  StartingScreen({super.key, this.familyGroupMap});

  LoginCubit loginCubit = LoginCubit();

  final List<Widget> _bottomNavigationBarPages = [
    HomeScreen(),
    ManageScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Manage'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Settings',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_box),
      label: 'Profile',
    ),
  ];

  // void _onNavigationItemBarTapped(int index) {
  //  // setState(() {});

  //        loginCubit.selectedIndex = index;

  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: _bottomNavigationBarPages[loginCubit.selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: KBackgroundColor),
            child: BottomNavBarView(      
              bottomNavigationBarItems: _bottomNavigationBarItems,
              selectedIndex: loginCubit.selectedIndex,
              onNavigationItemBarTapped: (index){
                print(  "Selected index: $index");
                loginCubit.changeTabeIndex(
                index,
              );
              }
              
              
            ),
          ),
        );
      },
    );
  }
}
