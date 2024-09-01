import 'package:flutter/material.dart';
import 'package:passwordmanager/configs/colors.dart';

class PasswordTile extends StatelessWidget {
  final String title;
  final String url;
  final String password;
  final String logo;
  final VoidCallback ontap;

  const PasswordTile({
    super.key,
    required this.title,
    required this.url,
    required this.password,
    required this.logo,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    String logoBaseUrl = "https://www.google.com/s2/favicons?sz=64&domain_url=";
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 80,
              decoration: BoxDecoration(
                color: lightBlueColor,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 80,
              child: Image.network(
                logoBaseUrl + logo,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.password,
                    size: 35,
                    color: Theme.of(context).colorScheme.primary,
                  );
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    url,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  const Text(
                    "**********",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
