import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import './Countries.dart';

class LanguageHandler extends GetxController {
  List<String> language = [];
  RxString fromSelectedLang = ''.obs;
  RxString toSelectedLang = ''.obs;
  String fromSelectedLangCode = '';
  String toSelectedLangCode = ''; // Fixed typo here
  RxString output = ''.obs;
  TextEditingController textEditingController = TextEditingController();
  RxBool loader = false.obs;



  @override
  void onInit() {
    Countries.forEach((key, value) {
      language.add(key);
    });

    super.onInit();
  }

  Future<void> translateText() async {
    loader = true.obs;
    final translator = GoogleTranslator();

    // Perform the translation
    try {
      // Ensure to handle potential null values
      String fromLangCode = Countries[fromSelectedLang.value] ?? '';
      String toLangCode = Countries[toSelectedLang.value] ?? '';

      // Check for empty values
      if (fromLangCode.isEmpty || toLangCode.isEmpty) {
        Get.snackbar(
        
          'Empty Vlaue',
            'Hey, Please Enter Some Value....😅'); // Handle case where languages are not selected
      }

      var translation = await translator.translate(
        textEditingController.text, // Use text instead of value.toString()
        from: fromLangCode,
        to: toLangCode,
      );

      loader = false.obs;
      output.value = translation.text; // Return the translated text
    } catch (e) {
      print("Error translating text: $e");
      Get.snackbar('Error ❌',
          'Looks Like Some Error Occured'); // Return an error message if something goes wrong
      loader = false.obs;
    }
  }
}
