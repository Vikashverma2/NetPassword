import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthKey extends StatelessWidget {
  final Widget text;
  final double width;
  final VoidCallback ontap;
  const AuthKey(
      {super.key,
      required this.text,
      required this.width,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ontap,
      child: Container(
        width: width / 5,
        height: width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Center(child: text),
      ),
    );
  }
}
