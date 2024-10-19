import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:language_translator/UI/Components/Button.dart';
import 'package:language_translator/UI/Components/Dropdown.dart';
import 'package:language_translator/UI/Components/TextField.dart';
import 'package:language_translator/UI/Controller/controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final languageHandler = Get.find<LanguageHandler>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdnb.artstation.com/p/assets/images/images/058/523/795/original/teetuch-timgasigum-star-space.gif?1674371659'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'LANGUAGE TRANSLATOR',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropDown(
                        languages: languageHandler.language,
                        type: 'from',
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: DropDown(
                          languages: languageHandler.language, type: 'to'),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: CustomTextField()),
                  ],
                ),
                SizedBox(height: 10),
                CustomButton(),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'RESULT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: languageHandler.loader == false? null: SpinKitChasingDots(
                  color: Colors.red,
                  size: 50,
                ),
                ),
                Obx(() {
                  return Text(
                    languageHandler.output.value.isEmpty
                        ? ""
                        : languageHandler.output.value,
                    style: TextStyle(color: Colors.white),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
