import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset(IconsAssets.home),
              const Text("Home"),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(IconsAssets.lock),
              const Text("Password"),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(IconsAssets.person),
              const Text("Profile"),
            ],
          ),
        ],
      ),
    );
  }
}
