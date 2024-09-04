import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback ontap;
  final String icon;
  const MyIconButton({super.key, required this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 35,
        height: 35,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
        child: SvgPicture.asset(
          icon,
          width: 15,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
