import 'package:family_gathering_v_0/cubits/cubit/cubit/profile_cubit.dart';
import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/constants.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';

class ConnectionWaysDropDownView extends StatefulWidget {
  const ConnectionWaysDropDownView({super.key});

  @override
  ConnectionWaysDropDownViewState createState() =>
      ConnectionWaysDropDownViewState();
}

class ConnectionWaysDropDownViewState
    extends State<ConnectionWaysDropDownView> {
  List<DropDownTextFieldItemModelModel> items = [];
  ProfileCubit profileCubit = ProfileCubit();

  @override
  void initState() {
    super.initState();

    items.add(DropDownTextFieldItemModelModel());

    for (var element in  ProfileCubit.currentUser!.memberConnectionMap!.entries.toList()){

      items.add(DropDownTextFieldItemModelModel(
        way: element.key,
        link: element.value,
      ));
    }
   // ProfileCubit.connectionWaysMapController = {};
  }

  void addItem() {
    setState(() {
      items.add(DropDownTextFieldItemModelModel());
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add button
              IconButton(icon: Icon(Icons.add), onPressed: addItem),

              // Dropdown for way
              DropdownButton<String>(
                value: item.way,
                hint: Text(' اختر طريقة '),
                items:
                    KConnectionWaysLabelsList.map(
                      (way) => DropdownMenuItem(value: way, child: Text(way)),
                    ).toList(),
                onChanged: (val) {
                  setState(() {
                    item.way = val;
                  });
                },
              ),
              SizedBox(width: 10),
              // TextField for input string
              Expanded(
                child: MyTxtFormField(
                  decoration: InputDecoration(hintText: 'انسخ رابط التواصل'),
                  onChanged: (val) {
                    item.link = val;
                    ProfileCubit.connectionWaysMapController![item.way] = val;
                  },
                ),
              ),
              // Remove button
              if (index == 0)
                SizedBox(width: 50)
              else
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => removeItem(index),
                ),
            ],
          ),
        );
      },
    );
  }
}
