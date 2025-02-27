import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class C_ProfilePage extends GetxController {
  final username = ''.obs;
  @override
  void onInit() {
    super.onInit();
    loadSharedPreferences();
  }

  Future<void> loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username')!;
  }
}
