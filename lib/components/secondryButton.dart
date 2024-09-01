import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';

class SecondryButton extends StatelessWidget {
  final String lable;
  final VoidCallback ontap;
  final String icon;
  final Color color;
  const SecondryButton({
    super.key,
    required this.lable,
    required this.ontap,
    required this.icon,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
          ),
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.2),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 15,
              color: color,
            ),
            SizedBox(width: 10),
            Text(
              lable,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
