import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_pro/Controllers/Signup_controller.dart';

import '../Widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        controller.count.value;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign up",
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
                    hintText: "enter your first name",
                    labelText: "First Name",
                    controller: controller.firstNameController),
                SizedBox(
                  height: 20,
                ),
                commonTextFormField(
                    hintText: "enter your last name",
                    labelText: "Last Name",
                    controller: controller.lastNameController),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    commonTextFormField(
                      width: 100,
                      hintText: "enter your password",
                      labelText: "Code",
                      readOnly: true,
                      controller: controller.countryCodeController,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: commonTextFormField(
                          hintText: "enter your phone number",
                          labelText: "Phone number",
                          controller: controller.phoneController),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
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
                  height: 20,
                ),
                commonTextFormField(
                    hintText: "confirm your password",
                    labelText: "Confirm Password",
                    controller: controller.conPasswordController),
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
                        title: "Sign up",
                        borderRadius: 10,
                        height: 50,
                        onTap: () {
                          controller.signupApi();
                        }),
                const SizedBox(
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
                        "Or signup with",
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
                      "Already have an account?",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: const Color(0xff007AFF),
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
