import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/configs/colors.dart';
import 'package:passwordmanager/configs/pageRoutes.dart';
import 'package:passwordmanager/controllers/authController.dart';

import '../../components/linkDeviceBottomSheet.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: lightBlueColor,
                      borderRadius: BorderRadius.circular(200),
                    ),
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.network(
                        authController.auth.currentUser!.photoURL!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade300,
                    ),
                    child: Text(
                      authController.auth.currentUser!.displayName ?? "User",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                authController.auth.currentUser!.email ?? "user@gmail.com",
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Text(
                          "203",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "Compromised",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  )),
                  Container(
                    width: 1,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context).colorScheme.primary
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Text(
                          "203",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "Week passwords",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context).colorScheme.primary
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context).colorScheme.primary
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Text(
                          "203",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "30 Days Old",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  )),
                  Container(
                    width: 1,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context).colorScheme.primary
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      children: [
                        Text(
                          "203",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "Strong",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () {
                  LinkDeviceBottomSheet(context);
                },
                leading: SvgPicture.asset(IconsAssets.device),
                title: Text("Link Device"),
              ),
              ListTile(
                onTap: () {
                  authController.logout();
                },
                leading: SvgPicture.asset(IconsAssets.close),
                title: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
