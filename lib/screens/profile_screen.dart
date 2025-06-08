import 'package:family_gathering_v_0/cubits/cubit/cubit/profile_cubit.dart';
import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/models/members_profile_model.dart';
import 'package:family_gathering_v_0/views/connection_ways_drop_down_view.dart';
import 'package:family_gathering_v_0/views/drop_down_txt_field_item.dart';
import 'package:family_gathering_v_0/widgets/custom_elevated_button.dart';
import 'package:family_gathering_v_0/widgets/custom_svg_img.dart';
import 'package:family_gathering_v_0/widgets/custom_txt.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static String id = "/profile_screen";

  ProfileScreen({super.key});

  ProfileCubit profileCubit = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                //   mainAxisSize: MainAxisSize.min, // important for scrolling
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            profileCubit.pickImage();
                          },
                          child: MySvg(svgImgPath: "assets/images/sms.svg")
                      
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  MyTxtFormField(
                    controller: profileCubit.nameController,
                    label:"اسمك",
                    keyboardType: TextInputType.name,
                    maxLength: 30,
                                       
                  ),
                  SizedBox(height: 10),
                  MyTxtFormField(
                    controller: profileCubit.phoneNumberController,
                    label: "رقم التليفون",
                    keyboardType: TextInputType.phone,
                    maxLength: 12,
                  ),
                  SizedBox(height: 10),

                  // For "محل الميلاد"
                  Row(
                    children: [
                      MyText(text: "محل الميلاد"),
                      SizedBox(width: 10),
                      Expanded(
                        // Use Expanded here inside Row to fill remaining space
                        child: MyTxtFormField(
                          controller: profileCubit.fromAddressController,
                          //   label: profileCubit.member!.fromAddress?.detaledAddress?? "محل الميلاد",
                          keyboardType: TextInputType.text,
                          maxLength: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // For "محل الإقامة"
                  Row(
                    children: [
                      MyText(text: "محل الإقامة"),
                      SizedBox(width: 10),
                      Expanded(
                        child: MyTxtFormField(
                          controller: profileCubit.livingAddressController,
                          // label:profileCubit.member!.livingAddress?.detaledAddress?? "محل الإقامة",
                          keyboardType: TextInputType.text,
                          maxLength: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  MyElevatedButton(
                    child: MyText(text: "إضافة طرق الاتصال الأخرى"),

                    onPressed: () {
                      profileCubit.connectionWaysValuesList.add(
                       DropDownTextFieldItemModelModel(),
                      );
                      
                    },
                  ),
ItemListScreen(),
                ],
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            profileCubit.assignProfileData();
          },
          elevation: 20,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          focusColor: Colors.blue,
          child: Icon(Icons.save),
        ),
      ),
    );
  }
}



/****************************** */

class Item {
  String? category;
  String? text;
  Item({this.category, this.text});
}

class ItemListScreen extends StatefulWidget {
  @override
  ItemListScreenState createState() => ItemListScreenState();
}

class ItemListScreenState extends State<ItemListScreen> {
  List<Item> items = [];

  List<String> categories = ['Category 1', 'Category 2', 'Category 3'];

  void addItem() {
    setState(() {
      items.add(Item());
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Add button
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addItem,
                ),
                // Remove button
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => removeItem(index),
                ),
                // Dropdown for category
                DropdownButton<String>(
                  value: item.category,
                  hint: Text('Select category'),
                  items: categories
                      .map((cat) => DropdownMenuItem(
                            child: Text(cat),
                            value: cat,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      item.category = val;
                    });
                  },
                ),
                // TextField for input string
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Enter text'),
                    onChanged: (val) {
                      item.text = val;
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    
  }
}
