import 'package:family_gathering_v_0/models/drop_down_txt_field_model.dart';
import 'package:family_gathering_v_0/reusables_and_constatnts/constants.dart';
import 'package:flutter/material.dart';
import 'package:family_gathering_v_0/widgets/custom_txt_field.dart'; // Assuming this is your custom TextFormField

class DropdownTextFieldsItem extends StatefulWidget {
  final int? index;
  List<DropDownTextFieldItemModelModel>? items;
  //final VoidCallback? onRemove; // Callback to handle removal

  DropdownTextFieldsItem({super.key, this.index, this.items});

  @override
  DropdownTextFieldsItemState createState() => DropdownTextFieldsItemState();
}

class DropdownTextFieldsItemState extends State<DropdownTextFieldsItem> {


  String? selectedOption;
  final TextEditingController controller = TextEditingController();

void addRow() {
    setState(() {
   //  items.add(DropDownTextFieldItemModelModel());
    });
  }

  void removeRow(int index) {
    setState(() {
     // items[index].dispose();
     // items.removeAt(index);
    });
  }

  @override
  void dispose() {
    //for (var item in items) {
      //item.dispose();
    }
    //super.dispose();
  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.add, ),
                onPressed: () {
                 // if (widget.onRemove != null) {
                //    widget.onRemove!();
                //  }
                },
              ),
            ),
            // Dropdown
            Expanded(
              flex: 1,
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedOption,
                hint: Text('اختيار'),
                onChanged: (newVal) {
                  setState(() {
                    selectedOption = newVal;
                  });
                },
                items: KConnectionWaysLabelsList
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(width: 5),
            // TextField
            Expanded(
              flex: 3,
              child: MyTxtFormField(
                controller: controller,
                label: 'ادخل النص',
                hint: 'ادخل النص',
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.delete, ),
                onPressed: () {
                 // if (widget.onRemove != null) {
                //    widget.onRemove!();
                //  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
