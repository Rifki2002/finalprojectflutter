import 'dart:convert';
import 'package:finalprojectflutter/model/contact_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController {
  var isLoading = true.obs;
  var usersList = <User>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        usersList.value = (data['data'] as List)
            .map((userJson) => User.fromJson(userJson))
            .toList();
      } else {
        Get.snackbar('Error', 'Failed to load contacts.');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
