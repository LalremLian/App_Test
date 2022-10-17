import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_test/controller/main_page_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainPageController = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    mainPageController.getBlogsList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Test'),
        ),
        body: Obx( () {
                if(mainPageController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: mainPageController.blogList.length,
                      itemBuilder: (BuildContext context, int index){

                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10.0),
                          child: Card(
                              elevation: 5.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('${mainPageController.blogList[index].id}'
                                        '\n${mainPageController.blogList[index].title}'
                                        '\n${mainPageController.blogList[index].subTitle}'
                                        '\n${mainPageController.blogList[index].date}',
                                      style: const TextStyle(fontSize: 16.0),),
                                  ),

                                  Row(
                                    children: [
                                      IconButton(
                                        iconSize: 20,
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () {
                                          // mainPageController.preset();
                                          mainPageController.updatePreset(index);
                                          showDialog(
                                              context: context,
                                              builder: (_) => CustomDialogBox(mainPageController: mainPageController, blogId: mainPageController.blogList[index].id.toString(), ID: 0, title: 'Update Blog',));
                                        },
                                      ),

                                      IconButton(
                                        iconSize: 20,
                                        color: Colors.redAccent,
                                        icon: const Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () {
                                          mainPageController.deleteBlog(mainPageController.blogList[index].id.toString()
                                          );
                                        },
                                      )
                                    ],
                                  )
                                ],
                              )
                          ),
                        );
                      });
                }
              }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              mainPageController.preset();
              showDialog(
                  context: context,
                  builder: (_) => CustomDialogBox(mainPageController: mainPageController, blogId: '', ID: 1, title: 'Create New Blog',));
            },
            child: const Icon(Icons.add)
        )
    );
  }
}


//-----------------------------------------------------------------Custom Widget
class CustomDialogBox extends StatelessWidget {
  CustomDialogBox({
    Key? key,
    required this.mainPageController,
    required this.blogId,
    required this.ID,
    required this.title,
  }) : super(key: key);

  String title ='';
  var ID = 0;
  String blogId = '';
  final MainPageController mainPageController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: mainPageController
                  .titleTextController,
              onSaved: (value) {
                mainPageController.title = value!;
              },
              style: const TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter title',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black45, width: 0.00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            TextFormField(
              controller: mainPageController
                  .subTitleTextController,
              onSaved: (value) {
                mainPageController.subTitle = value!;
              },
              style: const TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter SubTitle',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black45, width: 0.00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            TextFormField(
              controller: mainPageController
                  .slugTextController,
              onSaved: (value) {
                mainPageController.slug = value!;
              },
              style: const TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter Slug',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black45, width: 0.00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            TextFormField(
              controller: mainPageController
                  .descriptionTextController,
              onSaved: (value) {
                mainPageController.description = value!;
              },
              style: const TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter Description',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black45, width: 0.00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: mainPageController
                  .categoryIdTextController,
              onSaved: (value) {
                mainPageController.categoryId = value!;
              },
              style: const TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter Category ID',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black45, width: 0.00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            TextFormField(
              controller: mainPageController
                  .dateTextController,
              onSaved: (value) {
                mainPageController.date = value!;
              },
              style: const TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter Date',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black45, width: 0.00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            TextFormField(
              // enabled: false,
              controller: mainPageController
                  .tagsTextController,
              onSaved: (value) {
                mainPageController.tags = value!;
              },
              style: const TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.none,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter Tags',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black45, width: 0.00),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx( () => Row(
                    children: [
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(
                          Icons.download_outlined,
                        ),
                        onPressed: () {
                          mainPageController.getImage();
                        },
                      ),

                      SizedBox(
                        width: 140.0,
                        child: Text(mainPageController.fileName.value,
                            style: TextStyle(),overflow: TextOverflow.ellipsis),
                      ),
                    ],),
              )
            ),

            //............................................................TextButton
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Text("Close"),
                  onPressed: () {
                    mainPageController.preset();
                    Navigator.of(context).pop();
                  },
                ),
                //............................................................TextButton
                TextButton(
                  child: const Text("Proceed"),
                  onPressed: () {
                    if(ID == 1) {
                      mainPageController.createBlog();
                    } else {
                      mainPageController.updateBlog(blogId);
                    }
                    // webViewPageController.addAnotherLink();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        )
      ),
      title: Text(title),
      shape: const RoundedRectangleBorder(
        borderRadius:
        BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}