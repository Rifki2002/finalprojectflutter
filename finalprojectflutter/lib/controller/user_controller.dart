import 'package:get/get.dart';

class UserController extends GetxController {
  var email = ''.obs;

  void setEmail(String userEmail) {
    email.value = userEmail;
  }
}
