import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passwordmanager/actions/encrpytionAndDecryption.dart';
import 'package:passwordmanager/actions/getIconAsPerPwd.dart';
import 'package:passwordmanager/components/myIconButton.dart';
import 'package:passwordmanager/components/secondryButton.dart';
import 'package:passwordmanager/configs/assetsPaths.dart';
import 'package:passwordmanager/configs/notification.dart';
import 'package:passwordmanager/controllers/authController.dart';
import 'package:passwordmanager/controllers/passwordController.dart';
import 'package:passwordmanager/models/credential.dart';

class CredentialDetailsPage extends StatelessWidget {
  final Credential credential;
  const CredentialDetailsPage({
    super.key,
    required this.credential,
  });

  @override
  Widget build(BuildContext context) {
    String logoBaseUrl = "https://www.google.com/s2/favicons?sz=64&domain_url=";

    var icon = getIconPathForPasswordStrength(credential.passwordStrength!);
    var color = getColorForPasswordStrength(credential.passwordStrength!);
    RxString password = credential.hasPassword!.obs;
    RxBool isHide = true.obs;
    PasswordController passwordController = Get.put(PasswordController());
    final LocalAuthentication auth = LocalAuthentication();

    void showPassword() async {
      final bool canAuthenticateWithBio = await auth.canCheckBiometrics;
      if (canAuthenticateWithBio) {
        final bool didAuthenicate = await auth.authenticate(
          localizedReason: "Please authenticate",
          options: AuthenticationOptions(
            biometricOnly: false,
          ),
        );
        if (didAuthenicate) {
          password.value = decryptPassword(credential.hasPassword!);
          isHide.value = !isHide.value;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(credential.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.2),
                        ),
                        width: 100,
                        height: 100,
                        child: Image.network(
                          logoBaseUrl + credential.siteLogo!,
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
                    SizedBox(height: 10),
                    Text(
                      credential.title!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                SvgPicture.asset(
                  IconsAssets.person,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(credential.userName!,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  IconsAssets.lock,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Obx(
                        () => Text(
                            isHide.value ? "************" : password.value,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ],
                  ),
                ),
                MyIconButton(
                  ontap: () {
                    var password = decryptPassword(credential.hasPassword!);
                    Clipboard.setData(ClipboardData(text: password));
                    successMessage(context, "coped to clipboard");
                  },
                  icon: IconsAssets.copy,
                ),
                SizedBox(width: 10),
                Obx(
                  () => MyIconButton(
                    ontap: () {
                      showPassword();
                    },
                    icon: isHide.value
                        ? IconsAssets.openEye
                        : IconsAssets.closeEye,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: color,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password strength",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        credential.passwordStrength!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  IconsAssets.web,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Website address",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        credential.address!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset(
                  IconsAssets.text,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        credential.title!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SecondryButton(
                  color: Colors.red,
                  lable: "Delete",
                  ontap: () {
                    Get.defaultDialog(
                      title: "Delete Credential",
                      content: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: Column(
                          children: [
                            const Text(
                              "This details will be delete for permanent this action can't be undo.",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SecondryButton(
                                  color: Colors.grey,
                                  lable: "Delete",
                                  ontap: () {
                                    passwordController
                                        .deleteCredential(credential.id!);
                                  },
                                  icon: IconsAssets.delete,
                                ),
                                const SizedBox(width: 30),
                                SecondryButton(
                                  color: Colors.blue,
                                  lable: "Cancle",
                                  ontap: () {
                                    Get.back();
                                  },
                                  icon: IconsAssets.close,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  icon: IconsAssets.delete,
                ),
                SecondryButton(
                  lable: "Edit",
                  ontap: () {},
                  icon: IconsAssets.edit,
                )
              ],
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
