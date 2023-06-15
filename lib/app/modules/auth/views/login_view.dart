import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hello/app/modules/auth/views/register_view.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../widgets/country_phone_code_widget.dart';
import '../../../widgets/reusable_widgets.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView {
  LoginView({Key? key}) : super(key: key);
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _editingControllerPhoneNumber =
      TextEditingController();
  final TextEditingController _editingControllerPassword =
      TextEditingController();
  Country _country = Country(
      isoCode: 'BD', iso3Code: 'BGD', phoneCode: '880', name: 'Bangladesh');

  void onCountryPicked(Country country) {
    _country = country;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Obx(() {
        return LoadingOverlay(
          isLoading: _authController.authLoading.value,
          opacity: 0.8,
          progressIndicator: SpinKitCubeGrid(
            color: Theme.of(context).primaryColor,
            size: 50.0,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              shadowColor: Colors.white,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Get.back(),
              ),
              title: const Text(
                'Log In',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.to(RegisterView());
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration:
                              const BoxDecoration(color: Colors.black12),
                          child: const Center(
                            child: Text(
                              'Please enter your phone number',
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: rBuildCountryPickerDropdown(
                            context: context,
                            textEditingControllerPhoneNumber:
                                _editingControllerPhoneNumber,
                            onCountryPicked: onCountryPicked,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: rPrimaryTextField(
                            controller: _editingControllerPassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            borderColor: Colors.grey,
                            hintText: 'Enter password here',
                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30), // Adjust the radius as needed
                            ),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            String phoneNumber =
                                _editingControllerPhoneNumber.text.trim();
                            String password =
                                _editingControllerPassword.text.trim();
                            if (phoneNumber.isNotEmpty && password.isNotEmpty) {
                              if (password.length < 8) {
                                Get.snackbar(
                                  'Failed',
                                  "Password length must be at least 8 characters long.",
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                return;
                              }
                              if (_country.isoCode == 'BD') {
                                // Bangladeshi mobile number
                                int mobileNumber = int.parse(phoneNumber);
                                if (mobileNumber.toString().length < 10 ||
                                    !mobileNumber.toString().startsWith('1')) {
                                  Get.snackbar(
                                    'Failed',
                                    "${_country.name} mobile number is incorrect.",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }
                                _authController.tryToSignIn(
                                  mobile: mobileNumber.toString(),
                                  password: password,
                                );
                              } else {
                                _authController.tryToSignIn(
                                  mobile: phoneNumber,
                                  password: password,
                                );
                              }
                            } else {
                              Get.snackbar(
                                'Failed',
                                "All fields are required.",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 130, vertical: 8),
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: const Text(
                                'Forgot password',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              '|',
                              style: TextStyle(color: Colors.black45),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Get.to(RegisterView());
                              },
                              child: const Text(
                                'account appeal',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Other login methods',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Image.asset('assets/icons/icons8-google-48.png'),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                  'assets/icons/icons8-facebook-48.png'),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset('assets/icons/icons8-twitter-48.png'),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                  'assets/icons/icons8-vkontakte-48.png'),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset('assets/icons/icons8-twitter-48.png'),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        '>',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
