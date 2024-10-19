import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/UI/Controller/controller.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageHandler = Get.find<LanguageHandler>();
    return GestureDetector(
      onTap: () async {
        Future<void> translatedText =  languageHandler.translateText();
        print(translatedText); // Print the translated text to the console
      },
      child: Container(
        height: 56.25,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5), color: Colors.orange),
        child: Center(
            child: Text('TRANSLATE',
                style: TextStyle(
                    letterSpacing: 2, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
