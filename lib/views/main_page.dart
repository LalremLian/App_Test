import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/main_page_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainPageController = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    mainPageController.getDefinition2();
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Test'),
      ),
      body: Obx(
          () =>      ListView.builder(
              itemCount: mainPageController.blogList.length,
              itemBuilder: (BuildContext context, int index){

                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    child: ListTile(
                      title: Text('${mainPageController.blogList[index].id}'
                          '\n${mainPageController.blogList[index].title}'
                          '\n${mainPageController.blogList[index].subTitle}'
                          '\n${mainPageController.blogList[index].date}'),
                    ),
                  ),
                );
              }),
      )


    );
  }
}
