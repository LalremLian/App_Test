import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app_test/model/blog_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/remote_services.dart';

class MainPageController extends GetxController {

  String categoryId = '';
  String title = '';
  String subTitle = '';
  String slug = '';
  String description = '';
  String image = '';
  String date = '';
  String tags = '';

  String encodedData = '';

  var blogList = <BlogModel>[].obs;

  bool? isFirstLaunch;
  var isLoading = false.obs;
  var isLoaded = false.obs;
  var currentDate = DateTime.now().obs;

  TextEditingController titleTextController = TextEditingController();
  TextEditingController subTitleTextController = TextEditingController();
  TextEditingController slugTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController categoryIdTextController = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController tagsTextController = TextEditingController();


  //--------------------------------------------------------------Get Blogs List
  Future<void> getBlogsList() async {
    isLoading(true);
    var apiData = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('USER_TOKEN');

    var response = await RemoteService().getDta(token!);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var decodeJson = json.decode(response.body);

        apiData.addAll(decodeJson['data']['blogs']['data']);

        addAPIDataToBlogList(apiData);
        isLoading(false);

      } else {
        if (kDebugMode) {
          print("Blog List : Empty");
        }
      }
    } else {
      if (kDebugMode) {
        print("Blog List : Failed");
      }
    }
  }

  void addAPIDataToBlogList(var apiData) {
    blogList.clear();
    for (var item in apiData) {
      blogList.add(BlogModel(
          id: item['id'].toString(),
          categoryId: item['category_id'].toString(),
          title: item['title'].toString(),
          subTitle: item['sub_title'].toString(),
          slug: item['slug'].toString(),
          description: item['description'].toString(),
          image: (item['image'].toString() == '')?'':item['id'].toString(),
          date: item['date'].toString(),
          tags: item['tags'].toString()));
    }
  }
  RxString fileName = ''.obs;

  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    List<Object> g = [image!.path];

    File file = File(image.path);


    print(file.toString());
    fileName.value = file.toString();
    print('RX VALUE : ' + fileName.value);


    Uint8List imageByte = await image.readAsBytes();
    String base64 = base64Encode(imageByte);

    encodedData = base64;
  }


  //-----------------------------------------------------------------Create Blog
  Future<void> createBlog() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    title = titleTextController.text;
    subTitle = subTitleTextController.text;
    slug = slugTextController.text;
    description = descriptionTextController.text;
    categoryId = categoryIdTextController.text;
    // image = image.text;
    date = dateTextController.text;
    tags = tagsTextController.text;

    print('create BLOG ::: $categoryId');

    String? token = prefs.getString('USER_TOKEN');
    var response = await RemoteService().createBlogPost(title,subTitle,slug,description,categoryId,date,tags,encodedData,token!);

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


            getBlogsList();
            preset();

          } else {
            Get.snackbar(
              decodeJson['data'],
              '',
              colorText: Colors.redAccent[200],
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 1900),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }
        } else {
          if (kDebugMode) {
            print("Create Blog : Empty");
          }
        }
      } else {
        if (kDebugMode) {
          print("Create Blog : Failed");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception : $e');
      }
    } finally {isLoading(false);}

  }


  //-----------------------------------------------------------------Update Blog
  Future<void> updateBlog(String stId) async{
    isLoading(true);

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    title = titleTextController.text;
    subTitle = subTitleTextController.text;
    slug = slugTextController.text;
    description = descriptionTextController.text;
    categoryId = categoryIdTextController.text;
    date = dateTextController.text;
    tags = tagsTextController.text;

    String? token = prefs.getString('USER_TOKEN');
    var response = await RemoteService().updateBlogPost(stId,title,subTitle,slug,description,categoryId,date,tags,token!);

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

            getBlogsList();

          } else {
            Get.snackbar(
              decodeJson['data'],
              '',
              colorText: Colors.redAccent[200],
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 1900),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }
        } else {
          if (kDebugMode) {
            print("Update Blog : Empty");
          }
        }
      } else {
        if (kDebugMode) {
          print("Update Blog : Failed");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception : $e');
      }
    } finally {isLoading(false);}

  }


  //-----------------------------------------------------------------Delete Blog
  Future<void> deleteBlog(String stId) async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('USER_TOKEN');
    var response = await RemoteService().deleteBlogPost(stId,token!);

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

            getBlogsList();

          } else {
            Get.snackbar(
              decodeJson['data'],
              '',
              colorText: Colors.redAccent[200],
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 1900),
              forwardAnimationCurve: Curves.easeOutBack,
            );
          }
        } else {
          if (kDebugMode) {
            print("Delete Blog : Empty");
          }
        }
      } else {
        if (kDebugMode) {
          print("Delete Blog : Failed");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception : $e');
      }
    } finally {isLoading(false);}

  }


  //------------------------------------------------------------------------Preset
  void preset(){
    titleTextController.clear();
    subTitleTextController.clear();
    slugTextController.clear();
    descriptionTextController.clear();
    categoryIdTextController.clear();
    dateTextController.clear();
    tagsTextController.clear();

    fileName.value = 'Choose an Image';
    encodedData = '';
  }


  //---------------------------------------------------------------Update Preset
  void updatePreset(int blogId){

    preset();

    titleTextController = TextEditingController(text: blogList[blogId].title);
    subTitleTextController = TextEditingController(text: blogList[blogId].subTitle);
    slugTextController = TextEditingController(text: blogList[blogId].slug);
    descriptionTextController = TextEditingController(text: blogList[blogId].description);
    categoryIdTextController = TextEditingController(text: blogList[blogId].categoryId);
    dateTextController = TextEditingController(text: blogList[blogId].date);
    tagsTextController = TextEditingController(text: blogList[blogId].tags);
  }


}
