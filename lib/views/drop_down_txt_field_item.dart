

import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart';
import 'package:flutter/material.dart';

class DropdownTextFieldsItem extends StatefulWidget {

  final List<String> optionsList; 
 DropdownTextFieldsItem( {super.key, 
  required this.optionsList
}){
//this.addRoww();  
}

  @override
  State<DropdownTextFieldsItem> createState() => DropdownTextFieldsItemState();
}

class DropdownTextFieldsItemState extends State<DropdownTextFieldsItem> {
  final List<DropDownTextFieldItemModelModel> items = [];

  void addRow() {
    setState(() {
      items.add(DropDownTextFieldItemModelModel());
    });
  }

  void removeRow(int index) {
    setState(() {
      items[index].dispose();
      items.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (var item in items) {
      item.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  addRow();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final currentItem = items[index];
                  return Container();
                  //_buildRow(currentItem, index);
                },
              ),
            ),
      
          ],
        ),
      ),
    );
  }

  Widget _buildRow(DropDownTextFieldItemModelModel item, int index) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Dropdown
          SizedBox(
            width: 150,
            child: DropdownButton<String>(
              isExpanded: true,
              value: item.selectedOption,
              hint: Text('Select'),
              onChanged: (newVal) {
                setState(() {
                  item.selectedOption = newVal;
                });
              },
              items: widget.optionsList
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(width: 10),
          // TextField
          Expanded(
            child: MyTxtFormField(
              controller: item.controller,
              label: 'Enter text',
              hint: 'Enter text',
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => removeRow(index),
          ),
        ],
      ),
    ),
  );
}
  
  }
