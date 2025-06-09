import 'package:bloc/bloc.dart';
import 'package:family_gathering_v_0/models/group_model.dart';
import 'package:family_gathering_v_0/screens/home_screen.dart';
import 'package:family_gathering_v_0/screens/manage_screen.dart';
import 'package:family_gathering_v_0/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static late  GroupModel? currentGroup;

  int selectedIndex = 0;

  changeTabeIndex(int index) {

  selectedIndex = index;

    emit(ChangeTabIndex());

  }  
  final List<Widget> bottomNavigationBarPages = [
    HomeScreen(),
    ManageScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> bottomNavigationBarItems = [
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
  }



