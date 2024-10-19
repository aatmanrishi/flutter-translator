import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/UI/Controller/controller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
        final languagehandler = Get.find<LanguageHandler>();
    return TextFormField(
      controller:languagehandler.textEditingController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(
          'Please Enter Your Text',
          style: TextStyle(color: Colors.white),
        ),
        alignLabelWithHint: true, // Align label with hint text
        floatingLabelBehavior:
            FloatingLabelBehavior.never, // Keep label in place
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2)),
        errorStyle: TextStyle(color: Colors.red, fontSize: 15),
      ),
      maxLines: 5,
      scrollController: ScrollController(),
      // controller:  ,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Text Translate';
        }
      },
    );
  }
}
