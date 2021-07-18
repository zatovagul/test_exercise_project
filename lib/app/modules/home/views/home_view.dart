import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_project/app/widgets/buttons/custom_button.dart';
import 'package:sample_project/app/widgets/inputs/text_input.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final regButton = CustomButton(onPressed: controller.registrate, text: "Sign Up", color: CupertinoColors.activeGreen);
    final logButton = CustomButton(onPressed: controller.logIn, text: "Sign In",);
    return Obx(()=>Scaffold(
      appBar: AppBar(
        title: Text('Sign ${controller.isLogin.value ? "In" : "Up"}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: 30,),
            TextInput(
              controller: controller.emailController,
              hint: "email",
            ),
            SizedBox(height: 20,),
            TextInput(
              controller: controller.passwordController,
              hint: "password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(height: 20,),
            if(controller.isLogin.value)
              ...[logButton,SizedBox(height: 10,),regButton],
            if(!controller.isLogin.value)
              ...[regButton,SizedBox(height: 10,),logButton],
          ],
        ),
      ),
    ));
  }
}
