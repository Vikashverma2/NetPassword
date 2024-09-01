import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/components/searchbar.dart';
import 'package:passwordmanager/configs/responsiveLayout.dart';
import 'package:passwordmanager/controllers/passwordController.dart';
import 'package:passwordmanager/models/credential.dart';
import 'package:passwordmanager/pages/homePage/widgets/passwordTile.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
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
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/demo");
            },
            icon: const Icon(Icons.pages),
          )
        ],
        title: const Text('Password Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            MySearchBar(),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "All Credentials",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<Credential>>(
                stream: passwordController.getCredentialAsync(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No credentials found'));
                  } else {
                    List<Credential> credentials = snapshot.data!;
                    return ListView.builder(
                      itemCount: credentials.length,
                      itemBuilder: (context, index) {
                        final credential = credentials[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: PasswordTile(
                            title: credential.title!,
                            url: credential.address!,
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
    );
  }
}
