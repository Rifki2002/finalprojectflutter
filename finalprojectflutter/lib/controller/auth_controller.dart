import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  Future<void> loginUser() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void setEmail(String newEmail) {
    email.value = newEmail;
  }

  void setPassword(String newPassword) {
    password.value = newPassword;
  }
}
