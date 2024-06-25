import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiConstants.dart';
import '../CustomSnackBar.dart';
import '../Models/UserListModel.dart';
import '../webService.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;
  RxInt selectedView = 0.obs;
  bool loader = true;
  List<UserList> user_List = [];

  void onInit() {
    super.onInit();
    userListApi();
  }

  userListApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("token...$token");
    var res = await Webservices.getMap("$userList", token: {
      'Authorization':
          'Bearer $token',
      'Content-Type': 'application/json'
    });

    print("status from api ${res}");
    final resdata = UserListModel.fromJson(res);
    print(resdata);
    if (resdata.userList != null && resdata.status == true) {
      user_List = resdata.userList!;
      count.value++;
    } else {
      showSnackbar(Get.context!, resdata.message ?? 'no data found');
    }
  }
}
