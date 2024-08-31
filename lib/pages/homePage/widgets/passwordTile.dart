import 'package:flutter/material.dart';

class PasswordTile extends StatelessWidget {
  final String title;
  final String url;
  final String password;
  final String logo;

  const PasswordTile(
      {super.key,
      required this.title,
      required this.url,
      required this.password,
      required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Expanded(
        child: Row(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  url,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  password,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
