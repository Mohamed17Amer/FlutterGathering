import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_gathering_v_0/cubits/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reusables_and_constatnts/constants.dart';
import '../views/bottom_nav_bar_view.dart';

class StartingScreen extends StatelessWidget {
  static final String id = "/statring_screen";
  QueryDocumentSnapshot? familyGroupMap;
  StartingScreen({super.key, this.familyGroupMap});

  AppCubit appCubit = AppCubit();


  // void _onNavigationItemBarTapped(int index) {
  //  // setState(() {});

  //        AppCubit.selectedIndex = index;

  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: appCubit.bottomNavigationBarPages[appCubit.selectedIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: KBackgroundColor),
            child: BottomNavBarView(      
              bottomNavigationBarItems:appCubit.bottomNavigationBarItems,
              selectedIndex: appCubit.selectedIndex,
              onNavigationItemBarTapped: (index){
                print(  "Selected index: $index");
                appCubit.changeTabeIndex(
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
