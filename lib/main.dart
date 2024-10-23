import 'package:flutter/material.dart';
import 'package:friendly_rider/controllers/auth_controller.dart';
import 'package:friendly_rider/helpers/dependencies.dart' as dep;
import 'package:friendly_rider/routes/routes.dart';
import 'package:friendly_rider/utils/colors.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Friendly Inc. Rider',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
          ),
        ),
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.splashScreen,
      );
    });
  }
}
