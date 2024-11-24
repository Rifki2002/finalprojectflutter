import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserController userController = Get.find();
      userController.setEmail(userCredential.user!.email!);
      Get.offNamed('/home');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}
