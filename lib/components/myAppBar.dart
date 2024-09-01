import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/configs/colors.dart';
import 'package:passwordmanager/controllers/authController.dart';
import 'package:passwordmanager/demo/demoPage.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                    Image.network(authController.auth.currentUser!.photoURL!),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              authController.auth.currentUser!.displayName!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Get.to(DemoPage());
          },
          child: Container(
            decoration: BoxDecoration(
              color: lightBlueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(
              IconsAssets.notification,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
