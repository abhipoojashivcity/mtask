import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_pro/Models/SignInModel.dart';
import 'package:test_pro/Screens/Home.dart';
import 'package:test_pro/Screens/Signup.dart';

import '../ApiConstants.dart';
import '../CustomSnackBar.dart';
import '../GlobalData.dart';
import '../webService.dart';

class SignInController extends GetxController {
  RxInt count = 0.obs;
  RxBool showProgressbar = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isEmail = false.obs;
  final isPassword = false.obs;
  final hide = true.obs;

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};

  //late SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  goToSignUpScreen() {
    Get.to(() => SignUpScreen());
  }

  goToHome() {
    Get.to(() => const HomeScreen());
  }

  loginApi() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      Map<String, dynamic> data = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      isLoading.value = true;
      count.value++;
      print("data.....$data");
      var res = await Webservices.postData(
          apiUrl: "$userLogin",
          body: data,
          context: Get.context!,
          token: {'Authorization': token ?? ""});
      print("status from api ${res}");
      final resdata = SignInModel.fromJson(res);
      print("status.....${resdata.status}");
      if (resdata.status == true) {
        prefs.setString('token', resdata.record!.authtoken ?? "");
        token = resdata.record!.authtoken ?? "";
        signInResult = resdata.record;
        goToHome();
      } else {
        showSnackbar(Get.context!, resdata.message ?? "");
      }
      isLoading.value = false;
      count.value++;
    } else {
      showSnackbar(Get.context!, "Please enter email and password");
    }
  }

  changeProgressbarStatus(bool value) {
    showProgressbar.value = value;
  }
}
