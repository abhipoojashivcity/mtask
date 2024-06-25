import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_pro/Models/SignupModel.dart';
import 'package:test_pro/Screens/Signin.dart';

import '../ApiConstants.dart';
import '../CustomSnackBar.dart';
import '../GlobalData.dart';
import '../webService.dart';

class SignUpController extends GetxController {
  RxInt count = 0.obs;
  RxBool showProgressbar = false.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  FocusNode passwordEmail = FocusNode();
  FocusNode conPasswordPassword = FocusNode();

  final isEmail = false.obs;
  final isPassword = false.obs;
  final isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};

  //late SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  goToSignInScreen() {
    Get.to(() => SignInScreen());
  }

  signupApi() async {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        conPasswordController.text.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> data = {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "country_code": countryCodeController.text,
        "phone_no": phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "confirm_password": passwordController.text,
      };
      isLoading.value = true;
      count.value++;
      print("data.....$data");
      var res = await Webservices.postData(
          apiUrl: "$userRegister",
          body: data,
          context: Get.context!,
          token: {'Authorization': ''});
      print("status from api ${res}");
      final resdata = SignupModel.fromJson(res);
      print("status.....${resdata.status}");
      if (resdata.status == true) {
        SignupData result = resdata.data!;
        prefs.setString('token', result.token ?? "");
        token = result.token ?? "";
        goToSignInScreen();
        //goToHomeScreen();
      } else {
        showSnackbar(Get.context!, resdata.message ?? "");
      }
      isLoading.value = false;
      count.value++;
    } else {
      showSnackbar(Get.context!, "Please fill all the fields");
    }
  }

  changeProgressbarStatus(bool value) {
    showProgressbar.value = value;
  }
}
