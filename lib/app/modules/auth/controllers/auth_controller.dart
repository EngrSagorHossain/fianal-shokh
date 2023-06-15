import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:hello/app/modules/home/views/bottomnavigation_view.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../../../../utilis/api_endpoints.dart';
import '../../../firebase_helper/firebase_helper.dart';
import '../../../models/profile_model.dart';
import '../../../routes/app_pages.dart';
import '../../messenger/server_functions/server_functions.dart';

class AuthController extends GetxController {
  final authLoading = false.obs;
  final loadingChangePassword = false.obs;
  final loadingResetPassword = false.obs;
  // final selectedGender = genderData[0].obs;
  final selectedBirthDate = DateTime.now().obs;
  final profile = Profile().obs;
  final token = ''.obs;
  final isOtpRequested = false.obs;

  late StreamingSharedPreferences preferences;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() async {
    preferences = await StreamingSharedPreferences.instance;
    preferences.getString('token', defaultValue: '').listen((value) {
      token.value = value;
    });
    preferences.getString('profile', defaultValue: '').listen((value) {
      if (value.isNotEmpty) {
        profile.value = Profile.fromJson(jsonDecode(value));
      }
    });
  }



  void tryToSignIn({required String mobile, required String password}) async {
    authLoading.value = true;
    var data = {
      'phone': mobile,
      'password': password,
    };
    var dio = Dio();
    try {
      final response = await dio.post(
        kLoginUrl,
        data: data,
      );
      int? statusCode = response.statusCode;
      authLoading.value = false;
      if (statusCode == 200) {
        token.value = response.data['token'];
        profile.value = Profile.fromJson(response.data['profile']);
        preferences.setString('token', response.data['token']);
        preferences.setString('profile', jsonEncode(response.data['profile']));

        Get.snackbar(
          'Success',
          "You are Logged In now.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAll(const BottomnavigationView());
      } else {
        Get.snackbar(
          'Failed',
          "Something is wrong. Please try again.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
      authLoading.value = false;
      Get.snackbar(
        'Failed',
        "Something is wrong. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

//Refresh Profile
  void tryToRefresh() async {
    authLoading.value = true;
    var dio = Dio();
    try {
      final response = await dio.get(
        kRetriveProfile(int.parse(profile.value.user!.uid.toString())),
        options: Options(
          headers: {
            'accept': '*/*',
            'Authorization': 'Token ${token.value}',
          },
        ),
      );
      int? statusCode = response.statusCode;
      authLoading.value = false;
      if (statusCode == 200) {
        profile.value = Profile.fromJson(response.data['profile']);
        preferences.setString('profile', jsonEncode(response.data['profile']));
        Get.snackbar(
          'Success',
          "Refreshed Successfully.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        FireBaseHelper().addNewUser(
            isChatWith: '',
            uid: profile.value.user!.uid!,
            userStatus: 'Online');
      } else {
        Get.snackbar(
          'Failed',
          "Something is wrong. Please try again.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      authLoading.value = false;
      Get.snackbar(
        'Failed',
        "Something is wrong. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void tryToSignUp({
    required String fullName,
    required String mobileNumber,
    required String password,
    required String isoCode,
    required String iso3Code,
    required String phoneCode,
    required String countryName,
  }) async {
    authLoading.value = true;

    var data = {
      'full_name': fullName,
      'iso_code': isoCode,
      'iso3_code': iso3Code,
      'phone_code': phoneCode,
      'country_name': countryName,
      'mobile_number': mobileNumber,
      'password': password,
    };
    var dio = Dio();
    try {
      final response = await dio.post(
        kRegisterWithProfileUrl,
        data: data,
      );
      int? statusCode = response.statusCode;
      authLoading.value = false;
      if (statusCode == 201) {
        token.value = response.data['token'];
        profile.value = Profile.fromJson(response.data['profile']);
        preferences.setString('token', response.data['token']);
        preferences.setString('profile', jsonEncode(response.data['profile']));

        Get.snackbar(
          'Success',
          "Account created.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        FireBaseHelper().addNewUser(
            isChatWith: '',
            uid: profile.value.user!.uid!,
            userStatus: 'Online');
        getFCMDeviceToken().then((fcmDeviceToken) =>
            registerFCMDevice(fcmDeviceToken: fcmDeviceToken!));

        Get.offAll(const BottomnavigationView());
      } else {
        Get.snackbar(
          'Failed',
          "Something is wrong. You may try with another mobile number which is not registered yet.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('from here');
      print(e);
      authLoading.value = false;
      Get.snackbar(
        'Failed',
        "Something is wrong. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void tryToSignOut() async {
    authLoading.value = true;

    var dio = Dio();
    try {
      final response = await dio.post(
        kLogoutUrl,
        options: Options(
          headers: {
            'accept': '*/*',
            'Authorization': 'Token ${token.value}',
          },
        ),
      );
      int? statusCode = response.statusCode;
      authLoading.value = false;

      if (statusCode == 201) {
        preferences.clear();
        Get.offAllNamed(Routes.AUTH);
        token.value = '';
        // profile.value = Profile();
      } else {
        Get.snackbar(
          'Failed',
          "Something is wrong. Please check your internet connection.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      authLoading.value = false;
      Get.snackbar(
        'Failed',
        "Something is wrong. Please check your internet connection.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      preferences.clear();
      Get.offAllNamed(Routes.AUTH);
      token.value = '';
      // profile.value = Profile();
    }
  }

  void sendOtpRequest(String mobileNumber) {
    // authLoading.value = true;
    // //TODO: Api will call here
    // Timer(const Duration(seconds: 5), () {
    //   isOtpRequested.value = true;
    //   authLoading.value = false;
    // });
  }

  Future<bool> tryToChangePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    loadingChangePassword.value = true;
    final AuthController authController = Get.find();
    var dio = Dio();
    var data = {
      'old_password': oldPassword,
      'new_password': newPassword,
    };
    try {
      final response = await dio.put(
        kChangePasswordUpdateUrl,
        data: data,
        options: Options(headers: {
          'accept': '*/*',
          'Authorization': 'Token ${authController.token.value}',
        }),
      );
      int? statusCode = response.statusCode;
      loadingChangePassword.value = false;
      if (statusCode == 200) {
        Get.snackbar(
          'Success',
          "Your password has been changed.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      } else if (statusCode == 203) {
        Get.snackbar(
          'Failed',
          "Your credential is mismatch.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Failed',
          "Something is wrong. Please try again.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      loadingChangePassword.value = false;
      Get.snackbar(
        'Failed',
        "Something is wrong. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> tryToGeneratePasswordResetOTP({
    required String mobile,
    required String email,
  }) async {
    loadingResetPassword.value = true;
    var dio = Dio();
    var data = {
      'mobile': mobile,
      'email': email,
    };
    try {
      final response = await dio.post(
        kPasswordResetOtpGenerateCreateUrl,
        data: data,
        options: Options(headers: {
          'accept': '*/*',
        }),
      );
      int? statusCode = response.statusCode;
      loadingResetPassword.value = false;
      if (statusCode == 201) {
        Get.snackbar(
          'Success',
          "Password reset OTP has been sent to your email. Please check there.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
        );
        return true;
      } else {
        Get.snackbar(
          'Failed',
          "Your credential is mismatch.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      loadingResetPassword.value = false;
      Get.snackbar(
        'Failed',
        "Something is wrong. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }

  Future<bool> tryToResetPasswordWithOTP({
    required String mobile,
    required String password,
    required String otp,
  }) async {
    loadingResetPassword.value = true;
    var dio = Dio();
    var data = {
      'mobile': mobile,
      'password': password,
      'otp': otp,
    };
    try {
      final response = await dio.put(
        kResetPasswordWithOtpUpdateUrl,
        data: data,
        options: Options(headers: {
          'accept': '*/*',
        }),
      );
      int? statusCode = response.statusCode;
      loadingResetPassword.value = false;
      if (statusCode == 200) {
        Get.snackbar(
          'Success',
          "Password reset is done. You can login now.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 6),
        );
        Get.offAllNamed(Routes.AUTH);
        // return true;
      } else {
        Get.snackbar(
          'Failed',
          "Your credential is mismatch.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      loadingResetPassword.value = false;
      Get.snackbar(
        'Failed',
        "Something is wrong. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return false;
  }
}
