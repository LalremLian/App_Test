import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController>{
  final loginPageController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: SafeArea(
        child: Obx(() {
          if(loginPageController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  //-------------------------------------------------email field
                  const SizedBox(height: 200,),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Login',
                        style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
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

                  //----------------------------------------------Password field
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
                      obscureText: true,
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

                        prefixIcon: const Icon(
                          Icons.lock_open_outlined,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 0.00),
                          borderRadius: BorderRadius.circular(10.0),
                        ),

                      ),
                    ),
                  ),

                  //------------------------------------------------Login button
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

    );
  }
}
