import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pro/Controllers/Signin_controller.dart';
import 'package:test_pro/Widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        controller.count.value;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Sign in",
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  thickness: 2,
                ),
                SizedBox(
                  height: 30,
                ),
                commonTextFormField(
                    hintText: "enter your email",
                    labelText: "E-mail",
                    controller: controller.emailController),
                SizedBox(
                  height: 20,
                ),
                commonTextFormField(
                    hintText: "enter your password",
                    labelText: "Password",
                    controller: controller.passwordController),
                SizedBox(
                  height: 30,
                ),
                controller.isLoading.value
                    ? Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : RoundButton(
                        title: "Login",
                        borderRadius: 10,
                        height: 50,
                        onTap: () {
                          //   controller.goToHome();
                          controller.loginApi();
                        }),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or signin with",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/facebook_logo.svg"),
                        Image.asset(
                          "assets/images/google_logo.png",
                          height: 45,
                        ),
                        SvgPicture.asset("assets/images/apple_logo.svg"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToSignUpScreen();
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color(0xff007AFF),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      })),
    );
  }
}
