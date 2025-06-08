import 'package:family_gathering_v_0/cubits/cubit/cubit/profile_cubit.dart';
import 'package:family_gathering_v_0/views/drop_down_txt_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionWaysDropDownView extends StatelessWidget {
  ConnectionWaysDropDownView({super.key});
  ProfileCubit profileCubit = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount:
                profileCubit.connectionWaysValuesList.isEmpty
                    ? 1
                    : profileCubit.connectionWaysValuesList.length,
            itemBuilder: (context, index) {
              return DropdownTextFieldsItem(
                index: index,
                items: profileCubit.connectionWaysValuesList,
              );
            },
          );
        },
      ),
    );
  }
}
