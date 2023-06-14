import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeBackgroundService();

  // await Firebase.initializeApp();
  // await notificationInitialization();

  // FirebaseMessaging.onBackgroundMessage(messageHandler);
  // FCM Foreground
  // firebaseMessagingListener();
  //  AwesomeNotifications
  // notificationCallInitialization();
  Get.put(AuthController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shokh Live",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple,
        ),
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
        fontFamily: 'Roboto',
      ), // Enable color switching
    ),
  );
}
