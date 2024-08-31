import 'package:flutter/material.dart';
import 'package:passwordmanager/configs/responsiveLayout.dart';
import 'package:passwordmanager/pages/homePage/widgets/passwordTile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    return Scaffold(
        appBar: AppBar(
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
