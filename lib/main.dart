import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_pro/Screens/Home.dart';
import 'package:test_pro/Screens/Signin.dart';
import 'package:test_pro/Screens/Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/SignInScreen',
          page: () => const SignInScreen(),
        ),
        GetPage(
          name: '/SignUpScreen',
          page: () => const SignUpScreen(),
        ),
        GetPage(
          name: '/HomeScreen',
          page: () => const HomeScreen(),
        ),
      ],
      home: SignInScreen(),
    );
  }
}
