import 'package:friendly_rider/data/repo/auth_repo.dart';
import 'package:friendly_rider/routes/routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });
}

void logout() async {
  Get.offAllNamed(AppRoutes.loginScreen);
  // socketController.disconnectSocket();
  Future.delayed(const Duration(milliseconds: 500), () async {
  });
}