import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/cubits/app_cubit.dart';
import 'package:family_gathering_v_0/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reusables_and_constatnts/constants.dart';
import '../views/bottom_nav_bar_view.dart';

class StartingScreen extends StatefulWidget {
  static final String id = "/statring_screen";
  GroupModel? groupModel;
  StartingScreen({super.key, this.groupModel});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  AppCubit appCubit = AppCubit();
  @override
  void initState() {
    super.initState();
    AppCubit.currentGroup=widget.groupModel;

  }

  // void _onNavigationItemBarTapped(int index) {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: appCubit.bottomNavigationBarPages[appCubit.selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: KBackgroundColor),
            child: BottomNavBarView(
              bottomNavigationBarItems: appCubit.bottomNavigationBarItems,
              selectedIndex: appCubit.selectedIndex,
              onNavigationItemBarTapped: (index) {
                log("Selected index: $index");

                setState(() {
                appCubit.changeTabeIndex(index);
                });
              },
            ),
          ),
        );
      },
    );
  }
}
