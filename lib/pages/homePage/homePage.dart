import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/configs/responsiveLayout.dart';
import 'package:passwordmanager/pages/homePage/widgets/passwordTile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Get.toNamed("/addnewpassword");
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primaryContainer,
            size: 30,
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed("/demo");
              },
              icon: Icon(Icons.pages),
            )
          ],
          title: const Text('Password Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const PasswordTile(
                title: "Amazone Prime",
                url: "www.amazone.com",
                password: 'Nitishkumar',
                logo: "",
              ),
              isDesktop ? Text("Desktop") : Text("mobile")
            ],
          ),
        ));
  }
}
