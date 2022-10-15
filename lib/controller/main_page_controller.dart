import 'dart:async';
import 'dart:convert';

import 'package:app_test/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/test.dart';
import '../service/remote_services.dart';

class MainPageController extends GetxController {
  late TextEditingController editingController;

  final localStorage = GetStorage();
  var blogList = <BlogModel>[].obs;

  var isLoaded = false.obs;

  String error = 'No Definition found.';

  @override
  void onInit() {
    super.onInit();
    editingController = TextEditingController();
  }

  Future<void> getDefinition() async {
    isLoaded(true);

/*    if (value.isEmpty) {
      await Future.delayed(const Duration(seconds: 1));
      Get.snackbar("Enter something", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 2000),
          forwardAnimationCurve: Curves.easeOutBack);
      isLoaded(false);
      return;
    }*/

    String token = localStorage.read('USER_TOKEN');

    var response = await RemoteService().getBlogsData(token);

    if (response != null) {
      blogList.value = response.data.blogs.data.cast<BlogModel>();
      isLoaded(false);
    } else {
      Get.snackbar("Definition not found.", "",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 2000),
          forwardAnimationCurve: Curves.easeOutBack);

      isLoaded(false);
      // definitionList.clear();
    }

/*    print("Controller -----------");
    print(definitonList);*/
  }


  Future<void> getDefinition2() async {
    var apiData = [];

    String token = localStorage.read('USER_TOKEN');
    var response = await RemoteService().getDta(token);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var decodeJson = json.decode(response.body);
        // apiData = decodeJson['data']['appeal'];
        apiData.addAll(decodeJson['data']['blogs']['data']);
        print("From main Page :: " + apiData.toString());
        if (apiData.length <= 0) String a;
          // hasNextPage(false);
/*          if (apiData.length <= 0)
            noDataFoundFromSearch.value = true;
          else
            noDataFoundFromSearch.value = false;*/
        addAPIDataToBlogList(apiData);
        // isLoading(false);
        //print(decodeJson['data']['appeal']);
      } else {
        // hasNextPage(false);
        print("Court Execute : Empty");
      }
    } else
      print("Court Execute : Failed");
  }

  void addAPIDataToBlogList(var apiData) {
    for (var item in apiData) {
      print('ADDING ::: ' + apiData.toString());
      blogList.add(BlogModel(
          id: item['id'].toString(),
          categoryId: item['category_id'].toString(),
          title: item['title'].toString(),
          subTitle: item['sub_title'].toString(),
          slug: item['slug'].toString(),
          description: item['description'].toString(),
          image: (item['image'].toString() == '')?'':item['id'].toString(),
          date: item['date'].toString()));
    }
  }

}
