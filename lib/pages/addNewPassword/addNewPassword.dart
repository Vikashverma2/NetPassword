import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/components/primaryButton.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/configs/colors.dart';

class AddNewPasswordPage extends StatelessWidget {
  const AddNewPasswordPage({super.key});

  // this url for geting icon from url
// https://www.google.com/s2/favicons?sz=64&domain_url=microsoft.com
  @override
  Widget build(BuildContext context) {
    RxBool isHidden = false.obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Add New Passowrd"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                    ),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.password_outlined,
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Credential",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Text(
                                "Enter Title",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: "Ex : Devhq",
                              prefixIcon: Icon(
                                Icons.earbuds_battery,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Site Address",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: "example : www.devhq.in",
                              prefixIcon: Icon(
                                Icons.earbuds_battery,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "User Name",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: "example : Nitishroy7033",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Password",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => TextFormField(
                              obscureText: isHidden.value ? true : false,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                  hintText: "*****",
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  suffix: InkWell(
                                    onTap: () {
                                      isHidden.value = !isHidden.value;
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer,
                                      ),
                                      child: Text(
                                        isHidden.value ? "Show" : "Hide",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              PrimaryButton(
                title: "Save",
                icon: IconsAssets.lock,
                ontap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
