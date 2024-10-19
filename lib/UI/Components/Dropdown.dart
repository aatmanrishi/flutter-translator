import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/controller.dart';

class DropDown extends StatelessWidget {
  final List<String> languages;
  final String type;

  const DropDown({
    super.key,
    required this.languages,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final languageHandler = Get.find<LanguageHandler>();
    return Obx(
      () {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10), // Add padding if needed
          child: DropdownButton<String>(
            menuMaxHeight: 500,
            menuWidth: 150,
            isExpanded: true, // This makes the dropdown take full width
            focusColor: Colors.white,
            iconDisabledColor: Colors.white,
            iconEnabledColor: Colors.white,
            hint: Text(
              type == 'from' 
                  ? (languageHandler.fromSelectedLang.value.isEmpty ? "From" : languageHandler.fromSelectedLang.value)
                  : (languageHandler.toSelectedLang.value.isEmpty ? "to" : languageHandler.toSelectedLang.value),
              style: TextStyle(color: Colors.white),
            ),
            // dropdownColor: const Color.fromARGB(255, 5, 0, 104).withOpacity(0.5),
            dropdownColor: const Color.fromARGB(255, 16, 14, 56),
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            items: languages.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem,style:TextStyle(color:Colors.white)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                if (type == 'from') {
                  languageHandler.fromSelectedLang.value = newValue;
                } else {
                  languageHandler.toSelectedLang.value = newValue;
                }
              }
            },
          ),
        );
      },
    );
  }
}
