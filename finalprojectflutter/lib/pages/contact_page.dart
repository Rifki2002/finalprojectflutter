import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finalprojectflutter/controller/contact_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController controller = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kontak Penting',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.usersList.isEmpty) {
          return Center(child: Text('No contacts available.'));
        } else {
          return ListView.builder(
            itemCount: controller.usersList.length,
            itemBuilder: (context, index) {
              final user = controller.usersList[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              );
            },
          );
        }
      }),
    );
  }
}
