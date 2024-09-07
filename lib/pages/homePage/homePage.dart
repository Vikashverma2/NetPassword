import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/components/myAppBar.dart';
import 'package:passwordmanager/components/searchbar.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/configs/responsiveLayout.dart';
import 'package:passwordmanager/controllers/authController.dart';
import 'package:passwordmanager/controllers/passwordController.dart';
import 'package:passwordmanager/models/credential.dart';
import 'package:passwordmanager/pages/creadentialDetails/creadentialDetails.dart';
import 'package:passwordmanager/pages/homePage/widgets/passwordTile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    PasswordController passwordController = Get.put(PasswordController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Get.toNamed("/addnewpassword");
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primaryContainer,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const MyAppBar(),
              const SizedBox(height: 10),
              const MySearchBar(),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "All Credentials",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: StreamBuilder<List<Credential>>(
                  stream: passwordController.getCredentialAsync(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            IconsAssets.passwordTick,
                            width: 70,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'No credentials found',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      );
                    } else {
                      List<Credential> credentials = snapshot.data!;
                      return ListView.builder(
                        itemCount: credentials.length,
                        itemBuilder: (context, index) {
                          final credential = credentials[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: PasswordTile(
                              ontap: () {
                                Get.to(CredentialDetailsPage(
                                    credential: credential));
                              },
                              title: credential.title!,
                              url: credential.userName!,
                              password: credential.hasPassword!,
                              logo: credential.siteLogo!,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
