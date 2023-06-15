import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hello/app/modules/auth/views/login_view.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../widgets/country_phone_code_widget.dart';
import '../../../widgets/reusable_widgets.dart';
import '../controllers/auth_controller.dart';
import 'auth_view.dart';

class RegisterView extends GetView {
  RegisterView({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();
  final TextEditingController _editingControllerName = TextEditingController();
  final TextEditingController _editingControllerPhoneNumber =
      TextEditingController();
  final TextEditingController _editingControllerEmailAddress =
      TextEditingController();
  final TextEditingController _editingControllerPassword =
      TextEditingController();
  final TextEditingController _editingControllerConfirmPassword =
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
                'Register Now',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.to(LoginView());
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: const BoxDecoration(color: Colors.black12),
                    child: const Center(
                      child: Text(
                        'Please enter your phone number & password',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          rPrimaryTextField(
                            controller: _editingControllerName,
                            keyboardType: TextInputType.name,
                            borderColor: Colors.grey,
                            hintText: 'Enter your name here',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          rBuildCountryPickerDropdown(
                            context: context,
                            textEditingControllerPhoneNumber:
                                _editingControllerPhoneNumber,
                            onCountryPicked: onCountryPicked,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          rPrimaryTextField(
                            controller: _editingControllerPassword,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            borderColor: Colors.grey,
                            hintText: 'Enter password here',
                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          rPrimaryElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              String fullName =
                                  _editingControllerName.text.trim();
                              String phoneNumber =
                                  _editingControllerPhoneNumber.text.trim();
                              String password =
                                  _editingControllerPassword.text.trim();

                              if (fullName.isNotEmpty &&
                                  phoneNumber.isNotEmpty &&
                                  password.isNotEmpty) {
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
                                      !mobileNumber
                                          .toString()
                                          .startsWith('1')) {
                                    Get.snackbar(
                                      'Failed',
                                      "${_country.name} mobile number is incorrect.",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                    return;
                                  }
                                  _authController.tryToSignUp(
                                    fullName: fullName,
                                    mobileNumber: mobileNumber.toString(),
                                    password: password,
                                    isoCode: _country.isoCode,
                                    iso3Code: _country.iso3Code,
                                    phoneCode: _country.phoneCode,
                                    countryName: _country.name,
                                  );
                                } else {
                                  _authController.tryToSignUp(
                                    fullName: fullName,
                                    mobileNumber: phoneNumber,
                                    password: password,
                                    isoCode: _country.isoCode,
                                    iso3Code: _country.iso3Code,
                                    phoneCode: _country.phoneCode,
                                    countryName: _country.name,
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
                            primaryColor: Theme.of(context).primaryColor,
                            // buttonText: 'SEND OTP',
                            buttonText: 'SIGN UP',
                            fontSize: 16.0,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width - 21,
                              46,
                            ),
                            borderRadius: 8.0,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  Get.off(() => const AuthView());
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Other login methods',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black26,
                    ),
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
