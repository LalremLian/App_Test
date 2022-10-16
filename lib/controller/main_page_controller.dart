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

  bool? isFirstLaunch;
  var isLoaded = false.obs;
  var currentDate = DateTime.now().obs;

  TextEditingController titleTextController = TextEditingController();
  TextEditingController subTitleTextController = TextEditingController();
  TextEditingController slugTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController categoryIdTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController tagsTextController = TextEditingController();

  String error = 'No Definition found.';

  @override
  void onInit() {
    super.onInit();
    editingController = TextEditingController();

/*    titleTextController = TextEditingController();
    subTitleTextController = TextEditingController();
    slugTextController = TextEditingController();
    descriptionTextController = TextEditingController();
    categoryIdTextController = TextEditingController();
    dateTextController = TextEditingController();
    tagsTextController = TextEditingController();*/
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

    blogList.clear();
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

  String categoryId = '';
  String title = '';
  String subTitle = '';
  String slug = '';
  String description = '';
  String image = '';
  String date = '';
  String tags = '';

  //region Create Blog
  Future<void> createBlog() async{

    String token = localStorage.read('USER_TOKEN');
    var response = await RemoteService().createBlogPost(title,subTitle,slug,description,categoryId,date,tags,token);

    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var decodeJson = json.decode(response.body);

          if (decodeJson['message'].toString() == 'Blog Save Success') {
            Get.snackbar(
              'Successfully Added.',
              '',
              colorText: Colors.black54,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 1500),
              forwardAnimationCurve: Curves.easeOutBack,
            );

            getDefinition2();
            // siteNameList.add(url);

          } else {
            Get.snackbar(
              decodeJson['data'],
              '',
              colorText: Colors.redAccent[200],
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(milliseconds: 1900),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }
        } else {
          print("Court Execute : Empty");
        }
      } else {
        print("Court Execute : Failed");
      }
    } catch (e) {
      print('Exception : ' + e.toString());
    } finally {/*isLoading(false);*/}

  }
  //endregion


  Future<void> updateBlog(String stId) async{

    title = titleTextController.text;
    subTitle = subTitleTextController.text;
    slug = slugTextController.text;
    description = descriptionTextController.text;
    categoryId = categoryIdTextController.text;
    date = dateTextController.text;
    tags = tagsTextController.text;

    String token = localStorage.read('USER_TOKEN');
    var response = await RemoteService().updateBlogPost(stId,title,subTitle,slug,description,categoryId,date,tags,token);

    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var decodeJson = json.decode(response.body);

          if (decodeJson['message'].toString() == 'Blog Update Success') {
            Get.snackbar(
              'Successfully Updated.',
              '',
              colorText: Colors.black54,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 1500),
              forwardAnimationCurve: Curves.easeOutBack,
            );

            getDefinition2();
            // siteNameList.add(url);

          } else {
            Get.snackbar(
              decodeJson['data'],
              '',
              colorText: Colors.redAccent[200],
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(milliseconds: 1900),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }
        } else {
          print("Court Execute : Empty");
        }
      } else {
        print("Court Execute : Failed");
      }
    } catch (e) {
      print('Exception : ' + e.toString());
    } finally {/*isLoading(false);*/}

  }


  //region Delete Blog
  Future<void> deleteBlog(String stId) async{

    String token = localStorage.read('USER_TOKEN');
    var response = await RemoteService().deleteBlogPost(stId,token);

    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          var decodeJson = json.decode(response.body);

          if (decodeJson['message'].toString() == 'Blog Delete Success') {
            Get.snackbar(
              'Successfully Deleted.',
              '',
              colorText: Colors.black54,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 1500),
              forwardAnimationCurve: Curves.easeOutBack,
            );

            getDefinition2();

            // siteNameList.add(url);

          } else {
            Get.snackbar(
              decodeJson['data'],
              '',
              colorText: Colors.redAccent[200],
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(milliseconds: 1900),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }
        } else {
          print("Court Execute : Empty");
        }
      } else {
        print("Court Execute : Failed");
      }
    } catch (e) {
      print('Exception : ' + e.toString());
    } finally {/*isLoading(false);*/}

  }
//endregion

}
