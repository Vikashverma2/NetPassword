import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/configs/colors.dart';

Future<dynamic> LinkDeviceBottomSheet(BuildContext context) {
  return Get.bottomSheet(Container(
    padding: EdgeInsets.all(20),
    decoration:
        BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: lightBlueColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: SvgPicture.asset(
                  IconsAssets.device,
                  width: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Link Code",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              Text(
                "Don't share this code with anyone, this code can access your all save credential please keep this private. if you don't use code then please remove that",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1)),
                child: Text(
                  "76GS24DF",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Write this code in other device",
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
      ],
    ),
  ));
}
