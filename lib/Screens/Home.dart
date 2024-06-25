import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:test_pro/Controllers/HomeController.dart';

import '../GlobalData.dart';
import '../Models/UserListModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    'assets/images/profile_image.png',
                    height: 50,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${signInResult?.firstName??""} ${signInResult?.lastName??""}",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                     " ${signInResult?.email??""}",
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async{

            },
            child: Obx(() {
              controller.count.value;
              controller.selectedView.value;
              return Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                width: MediaQuery.of(context).size.width,
                color: Colors.blue.withOpacity(0.1),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User list",
                          style: GoogleFonts.openSans(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.selectedView.value = 0;
                                },
                                child: SvgPicture.asset(
                                  "assets/images/List_Icon.svg",
                                  color: controller.selectedView.value == 0
                                      ? Color(0xff007AFF)
                                      : Colors.black,
                                  height: 22,
                                  width: 24,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.selectedView.value = 1;
                                },
                                child: SvgPicture.asset(
                                  "assets/images/Grid_Icon.svg",
                                  color: controller.selectedView.value == 1
                                      ? Color(0xff007AFF)
                                      : Colors.black,
                                  height: 20,
                                  width: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.px),
                    controller.user_List.isEmpty?CircularProgressIndicator(color: Color(0xff007AFF)):
                    Expanded(
                        child: controller.selectedView.value == 0
                            ? ListViewContainer()
                            : GridViewContainer())
                  ],
                ),
              );
            }),
          )),
    );
  }

  Widget GridViewContainer() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.px,
            crossAxisSpacing: 10.px,
            childAspectRatio: 1.2),
        itemCount: controller.user_List.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.px),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5), width: 0.5.px)),
            margin: EdgeInsets.all(5.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 "${controller.user_List[index].firstName}",
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontSize: 12),
                ),
                Text(
                  "${controller.user_List[index].lastName}",
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontSize: 12),
                ),
                Text(
                  "${controller.user_List[index].email}",
                  maxLines: 1,
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontSize: 12),
                ),
                Text(
                  "${controller.user_List[index].phoneNo}",
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontSize: 12),
                ),
                SizedBox(
                  height: 10.px,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.px),
                      border:
                          Border.all(color: Color(0xff007AFF), width: 1.px)),
                  child: Center(
                    child: Text(
                      "View Profile",
                      style: GoogleFonts.openSans(
                          color: Color(0xff007AFF), fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget ListViewContainer() {
    return ListView.builder(itemCount: controller.user_List.length,
        itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)),
            margin: EdgeInsets.only(bottom: 10.px),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.user_List[index].firstName} ${controller.user_List[index].lastName}",
                    style:
                        GoogleFonts.openSans(color: Colors.black, fontSize: 12),
                  ),
                  Text(
                    "${controller.user_List[index].email} ${controller.user_List[index].phoneNo}",
                    style:
                        GoogleFonts.openSans(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
              trailing: Container(
                width: 100.px,
                height: 30.px,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.px),
                    border: Border.all(color: Color(0xff007AFF), width: 1.px)),
                child: Center(
                  child: Text(
                    "View Profile",
                    style: GoogleFonts.openSans(
                        color: Color(0xff007AFF), fontSize: 12),
                  ),
                ),
              ),
            )));
  }
}
