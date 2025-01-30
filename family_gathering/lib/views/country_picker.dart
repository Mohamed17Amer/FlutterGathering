import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  CountryPickerState createState() => CountryPickerState();
}

class CountryPickerState extends State<CountryPicker> {
  
  @override
  Widget build(BuildContext context) {
    return    CountryCodePicker(
                onChanged: (countryCode) {
                  debugPrint(
                    "on change ${countryCode.name} ${countryCode.dialCode} ${countryCode.name}",
                  );
                },
                onInit: (countryCode) {
                  debugPrint(
                    "on init ${countryCode?.name} ${countryCode?.dialCode} ${countryCode?.name}",
                  );
                },

                initialSelection: 'EG',
                favorite: const [ 'EG'],
                showFlagDialog: true,
                flagDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                comparator: (a, b) => b.name!.compareTo(a.name!),
                hideMainText: false,
                showFlagMain: true,
                showFlag: true,
                hideSearch: false,
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
                barrierColor: Colors.black,
                backgroundColor: Colors.amber,
                dialogBackgroundColor: Colors.pink,
                
              );
  }
    
    
    
    
    
    
    
    
    
    
}