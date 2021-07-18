import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_project/app/data/firebase_auth_provider.dart';

class HomeController extends GetxController {
  TextEditingController emailController, passwordController;
  RxBool isLogin = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    checkAuth();
  }

  checkAuth()async{
    instanceFireBaseAuthProvider.isAlreadyAuthenticated();
  }

  logIn()async{
    if(!isLogin.value){
      isLogin.value = true; return;
    }
    if(emailController.text.isEmpty || passwordController.text.isEmpty){
      Get.snackbar("Введите данные", "email или пароль");
    }
    else{
      instanceFireBaseAuthProvider.logIn(emailController.text, passwordController.text);
    }
  }
  registrate()async{
    if(isLogin.value){
      isLogin.value = false;return;
    }
    if(emailController.text.isEmpty || passwordController.text.isEmpty){
      Get.snackbar("Введите данные", "email или пароль");
    }
    else{
      instanceFireBaseAuthProvider.registrate(emailController.text, passwordController.text);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
