/*
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
        title: const Text('App'),
      ),
      body: Obx(
          () =>      ListView.builder(
              itemCount: mainPageController.blogList.length,
              itemBuilder: (BuildContext context, int index){

                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    child: Row(
                      children: [
                        ListTile(
                          title: Text('${mainPageController.blogList[index].id}'
                              '\n${mainPageController.blogList[index].title}'
                              '\n${mainPageController.blogList[index].subTitle}'
                              '\n${mainPageController.blogList[index].date}'),
                        ),
*/
/*                        IconButton(
                          iconSize: 100,
                          icon: const Icon(
                            Icons.edit,
                          ),
                          onPressed: () {

                          },
                        ),*//*

*/
/*                        IconButton(
                          iconSize: 100,
                          color: Colors.redAccent,
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () {
                            mainPageController.deleteBlog(mainPageController.blogList[index].id.toString()
                            );
                          },
                        ),*//*

                      ],
                    )


                  ),
                );
              }),
      ),
*/
/*        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: FloatingActionButton(
        // isExtended: true,
        backgroundColor: Colors.green,
    onPressed: () {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Create new Blog"),
            shape: const RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(20)),
            ),
            // content: const Text("Are you sure do you want to book this Inn?"),
            actions: <Widget>[
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
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter tile',
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
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter tile',
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
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter tile',
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
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter tile',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.black45, width: 0.00),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              TextFormField(
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
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter tile',
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
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter tile',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.black45, width: 0.00),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              TextFormField(
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
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintText: 'Enter tile',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.black45, width: 0.00),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              //............................................................TextButton

              TextButton(
                child: const Text("Close"),
                onPressed: () {
*//*
*/
/*                  var snackBar = const SnackBar(
                      duration: Duration(milliseconds: 2000),
                      content:
                      Text('Thanks for using our App.'));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar);*//*
*/
/*
                  Navigator.of(context).pop();
                },
              ),

              //............................................................TextButton
              TextButton(
                child: const Text("Proceed"),
                onPressed: () {
                  mainPageController.createBlog();
                  // webViewPageController.addAnotherLink();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
    },
        // isExtended: true,
        child: const Icon(Icons.add)
    )*//*


    );
  }
}
*/
















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
          title: const Text('App'),
        ),
        body: Obx(
              () =>      ListView.builder(
              itemCount: mainPageController.blogList.length,
              itemBuilder: (BuildContext context, int index){

                return Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 10.0),
                  child: Card(
                    elevation: 5.0,
                    child: Row(
                      children: [
                        Text('${mainPageController.blogList[index].id}'
                            '\n${mainPageController.blogList[index].title}'
                            '\n${mainPageController.blogList[index].subTitle}'
                            '\n${mainPageController.blogList[index].date}'),

                      IconButton(
                        iconSize: 20,
                        icon: const Icon(
                          Icons.edit,
                        ),
                        onPressed: () {

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

/*                    ListTile(
                      title: Text('${mainPageController.blogList[index].id}'
                          '\n${mainPageController.blogList[index].title}'
                          '\n${mainPageController.blogList[index].subTitle}'
                          '\n${mainPageController.blogList[index].date}'),
                    ),*/
                  ),
                );
              }),
        )







    );
  }
}