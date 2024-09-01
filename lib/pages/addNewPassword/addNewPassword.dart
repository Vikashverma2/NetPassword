import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:passwordmanager/actions/extractBaseDomain.dart';
import 'package:passwordmanager/actions/generatePassword.dart';
import 'package:passwordmanager/components/primaryButton.dart';
import 'package:passwordmanager/components/secondryButton.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/actions/getIconAsPerPwd.dart';
import 'package:passwordmanager/actions/passwordStrenth.dart';
import 'package:passwordmanager/controllers/passwordController.dart';

import '../../actions/checkUrl.dart';

class AddNewPasswordPage extends StatelessWidget {
  const AddNewPasswordPage({super.key});

  // this url for geting icon from url
// https://www.google.com/s2/favicons?sz=64&domain_url=microsoft.com
  @override
  Widget build(BuildContext context) {
    RxBool isHidden = false.obs;
    RxString passwordStrength = "week".obs;
    RxString passwordIcon = IconsAssets.lock.obs;
    Rx<Color> strengthColor = Colors.grey.obs;
    TextEditingController pwd = TextEditingController();
    TextEditingController websiteAddress = TextEditingController();
    TextEditingController baseDomain = TextEditingController();
    TextEditingController userName = TextEditingController();
    RxString url = "".obs;
    RxString websiteLogo = IconsAssets.lock.obs;
    String logoBaseUrl = "https://www.google.com/s2/favicons?sz=64&domain_url=";
    RxBool isUrlValid = false.obs;
    PasswordController passwordController = Get.put(PasswordController());
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
                    child: Obx(() => Image.network(
                          logoBaseUrl + url.value,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.password,
                              size: 50,
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
                        )),
                  ),
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
                                "Site Address",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: websiteAddress,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            onChanged: (value) {
                              isUrlValid.value = isValidUrl(value);
                              print(isUrlValid.value);
                              if (isUrlValid.value) {
                                baseDomain.text = extractBaseDomain(value);
                                url.value = extractBaseDomain(value);
                              }
                            },
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
                                "Enter Title",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: baseDomain,
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
                                "User Name",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: userName,
                            style: const TextStyle(
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
                              Obx(
                                () => Text(
                                  "Password - $passwordStrength",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: strengthColor.value),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => TextFormField(
                              controller: pwd,
                              onChanged: (value) {
                                passwordStrength.value =
                                    checkPasswordStrength(value);
                                passwordIcon.value =
                                    getIconPathForPasswordStrength(
                                        passwordStrength.value);
                                strengthColor.value =
                                    getColorForPasswordStrength(
                                        passwordStrength.value);
                              },
                              obscureText: isHidden.value ? true : false,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                  hintText: "*****",
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  suffix: SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(
                                          passwordIcon.value,
                                          color: strengthColor.value,
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            isHidden.value = !isHidden.value;
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SecondryButton(
                                lable: "Copy",
                                ontap: () {
                                  Clipboard.setData(
                                      ClipboardData(text: pwd.text));
                                },
                                icon: IconsAssets.copy,
                              ),
                              const SizedBox(width: 20),
                              SecondryButton(
                                lable: "Generate password",
                                ontap: () {
                                  var value = generatePassword();
                                  passwordStrength.value =
                                      checkPasswordStrength(value);
                                  passwordIcon.value =
                                      getIconPathForPasswordStrength(
                                          passwordStrength.value);
                                  strengthColor.value =
                                      getColorForPasswordStrength(
                                          passwordStrength.value);
                                  pwd.text = value;
                                },
                                icon: IconsAssets.refresh,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    passwordController.isLoading.value
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: PrimaryButton(
                              title: "Save",
                              icon: IconsAssets.lock,
                              ontap: () async {
                                bool isSuccess = await passwordController
                                    .createNewCredential(
                                  websiteAddress.text,
                                  baseDomain.text,
                                  userName.text,
                                  pwd.text,
                                  url.value,
                                  passwordStrength.value,
                                );
                                if (isSuccess) {
                                  websiteLogo.value = "";
                                  websiteAddress.clear();
                                  baseDomain.clear();
                                  userName.clear();
                                  pwd.clear();
                                }
                              },
                            ),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
