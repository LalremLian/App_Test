/*
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
*/



// import 'package:e_court/general_certificate_court/pages/cdap_login_page/view/cdap_login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_page_controller.dart';

// import 'package:e_court/general_certificate_court/pages/login_page/controller/login_page_controller.dart';



class LoginPage extends GetView<LoginPageController>{
  final loginPageController = Get.put(LoginPageController());

/*  TextEditingController userTextEditingController = new TextEditingController(text: "gco.dhaka@gmail.com");
  TextEditingController passTextEditingController = new TextEditingController(text: "12345678");*/

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double centerContainerHeight = 650.00;

    return Scaffold(
      backgroundColor: Colors.green[300],
      body: SafeArea(
        child: Obx(() {
          if(loginPageController.isLoading.value) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  // ...........................email field
                  const SizedBox(height: 200,),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Login',style: TextStyle(),textAlign: TextAlign.left,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
                    child: TextFormField(
                      controller: controller.emailController,
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      keyboardType: TextInputType.emailAddress,
                      //controller: userTextEditingController,
                      style: const TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,

                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 0.00),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),

                  //............................pass field
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                    child: TextFormField(
                      controller: controller.passwordController,
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                      //controller: passTextEditingController,
                      obscureText: true,
                      style: const TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10),
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,

                        prefixIcon: Icon(
                          Icons.lock_open_outlined,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, width: 0.00),
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                      ),
                    ),
                  ),

                  //..........................login button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
                    child: Container(
                      height: 45,
                      // width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepPurple,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF233456),
                            offset: Offset.zero,
                            blurRadius: 3.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () async {
                            controller.checkLogin();
                          },
                          child: const Center(
                            child: Text('Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }


        }
        ),
      ),

      //whole screen

      // Container(
      //
      //   color: Colors.black26,
      //   child: Column(
      //     children: [
      //       Expanded(
      //         flex: 2,
      //         child: SizedBox(
      //           width: 1,
      //         ),
      //       ), // upper empty space
      //       Padding(
      //         padding: EdgeInsets.all(20),
      //         child: Container(
      //           // middle content
      //           // color: Colors.grey,
      //           // decoration: BoxDecoration(
      //           //   color: Colors.purpleAccent,
      //           //   borderRadius: BorderRadius.circular(10),
      //           // ),
      //           height: 400,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Expanded(
      //                 child: Container(
      //                   // semi visible layer container
      //                   decoration: BoxDecoration(
      //                     color: Color.fromRGBO(250, 250, 250, .2),
      //                     borderRadius: BorderRadius.circular(10),
      //                   ),
      //                   // color: Color.fromRGBO(250, 250, 250, .2),
      //                   child: Column(
      //                     // user button containing column
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     // crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       // SizedBox(height: 10,),
      //                       const Text(
      //                         "লগইন",
      //                         style: TextStyle(
      //                           fontSize: 28,
      //                           fontWeight: FontWeight.bold,
      //                           color: Colors.deepPurpleAccent,
      //                         ),
      //                       ),
      //                       SizedBox(height: screenHeight * .01),
      //                       Text(
      //                         "এখনও কোন অ্যাকাউন্ট নেই? সাইনআপ",
      //                         style: TextStyle(
      //                           fontSize: 18,
      //                           color: Colors.black.withOpacity(.6),
      //                         ),
      //                       ),
      //
      //                       // user field
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
      //                         child: TextField(
      //                           style: TextStyle(
      //                             fontSize: 20.0,
      //                             decoration: TextDecoration.none,
      //                             color: Colors.black,
      //                           ),
      //                           decoration: InputDecoration(
      //                             // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //                             contentPadding:
      //                                 EdgeInsets.symmetric(vertical: 10),
      //                             filled: true,
      //                             fillColor: Colors.white,
      //                             focusColor: Colors.white,
      //
      //                             prefixIcon: Icon(
      //                               Icons.phone_android_sharp,
      //                               color: Colors.grey,
      //                             ),
      //                             hintText: "Enter Your Email",
      //                             border: OutlineInputBorder(
      //                               borderSide: BorderSide(
      //                                   color: Colors.white, width: 0.00),
      //                               borderRadius: BorderRadius.circular(10.0),
      //                             ),
      //                             focusedBorder: OutlineInputBorder(
      //                               borderSide: BorderSide(
      //                                   color: Colors.white, width: 0.00),
      //                               borderRadius: BorderRadius.circular(10.0),
      //                             ),
      //                             enabledBorder: OutlineInputBorder(
      //                               borderSide: BorderSide(
      //                                   color: Colors.white, width: 0.00),
      //                               borderRadius: BorderRadius.circular(10.0),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       //pass field
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
      //                         child: TextField(
      //                           obscureText: true,
      //                           style: TextStyle(
      //                             fontSize: 20.0,
      //                             decoration: TextDecoration.none,
      //                             color: Colors.black,
      //                           ),
      //                           decoration: InputDecoration(
      //                             // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      //                             contentPadding:
      //                                 EdgeInsets.symmetric(vertical: 10),
      //                             filled: true,
      //                             fillColor: Colors.white,
      //                             focusColor: Colors.white,
      //
      //                             prefixIcon: Icon(
      //                               Icons.lock_open_outlined,
      //                               color: Colors.grey,
      //                             ),
      //                             hintText: "Enter Your Password",
      //                             border: OutlineInputBorder(
      //                               borderSide: BorderSide(
      //                                   color: Colors.white, width: 0.00),
      //                               borderRadius: BorderRadius.circular(10.0),
      //                             ),
      //                             focusedBorder: OutlineInputBorder(
      //                               borderSide: BorderSide(
      //                                   color: Colors.white, width: 0.00),
      //                               borderRadius: BorderRadius.circular(10.0),
      //                             ),
      //                             enabledBorder: OutlineInputBorder(
      //                               borderSide: BorderSide(
      //                                   color: Colors.white, width: 0.00),
      //                               borderRadius: BorderRadius.circular(10.0),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //
      //                       // login button
      //                       Padding(
      //                         padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
      //                         child: Container(
      //                           height: 45,
      //                           // width: 220,
      //                           decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(20),
      //                             color: Colors.deepPurple,
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Color(0xFF233456),
      //                                 offset: Offset.zero,
      //                                 blurRadius: 3.0,
      //                                 spreadRadius: 0.0,
      //                               ),
      //                             ],
      //                           ),
      //                           child: Material(
      //                             color: Colors.transparent,
      //                             child: InkWell(
      //                               borderRadius: BorderRadius.circular(20),
      //                               onTap: () async {},
      //                               child: Center(
      //                                 child: Text(
      //                                   "লগইন",
      //                                   style: TextStyle(
      //                                     fontSize: 20,
      //                                     fontWeight: FontWeight.bold,
      //                                     color: Colors.white70,
      //                                     decoration: TextDecoration.none,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         flex: 2,
      //         child: SizedBox(
      //           width: 1,
      //         ),
      //       ), // lower empty space
      //     ],
      //   ),
      // ),

    );
  }
}
