import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  Future<void> registerUser(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      Get.snackbar(
        "Success",
        "Registration successful! Welcome ${userCredential.user!.email}",
      );

      Get.offNamed('/login');
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = "An account already exists for this email.";
      } else {
        message = e.message ?? "An error occurred.";
      }
      Get.snackbar("Error", message);
    } finally {
      isLoading.value = false;
    }
  }
}
