
import 'package:flutter/material.dart';
import 'package:friendly_rider/routes/routes.dart';
import 'package:friendly_rider/utils/app_constants.dart';
import 'package:friendly_rider/utils/colors.dart';
import 'package:friendly_rider/utils/dimensions.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  /* bool isLogin = true;

  final Connectivity _connectivity = Connectivity();

  bool isConnected = false;

  Future<void> _checkConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _connected = false;
      });
    } else {
      setState(() {
        _connected = true;
      });
    }
  }*/

  void verifyForm() {
    if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
      print('Forms has being filled you can Proceed');
      Get.snackbar('Login Successfull!', 'Proceed to dashboard',
          backgroundColor: AppColors.secondaryColor,
          colorText: AppColors.primaryColor,
          icon: Icon(Icons.check_circle_outline_sharp,
              size: 30, color: AppColors.primaryColor),
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height20));
      Get.offNamed(AppRoutes.floatingBar, arguments: 0);
    } else {
      print('Please fill in both fields');
      Get.snackbar(
        'Field can\'t be left Empty',
        'Fill in required field',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.white,
        icon: Icon(Icons.cancel_outlined, size: 30, color: AppColors.white),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height20),
      );
    }
  }

  bool showPassword = false;

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  bool rememberMe = false;

  void toggleRememberMe() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: Dimensions.screenHeight,
                width: Dimensions.screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      AppConstants.getPngAsset('bgdoodle'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -(Dimensions.height100),
              right: -(Dimensions.width15 * 10),
              child: Container(
                height: Dimensions.height100 * 4,
                width: Dimensions.width100 * 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppConstants.getPngAsset('bgfood'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight,
              width: Dimensions.screenWidth,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height20,
                      horizontal: Dimensions.width20),
                  // margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  height: Dimensions.height100 * 5,
                  width: Dimensions.width39 * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Login text
                      Text(
                        'Welcome back Administrator',
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // Space
                      SizedBox(height: Dimensions.height50),

                      // Username field
                      TextField(
                        controller: userController,
                        // keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            height: Dimensions.height18,
                            width: Dimensions.width18,
                            AppConstants.getPngAsset('user'),
                          ),
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: Dimensions.font17),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide:
                            BorderSide(width: Dimensions.width5/Dimensions.width50, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide(width: Dimensions.width5/Dimensions.width10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide(width: Dimensions.width5/Dimensions.width10),
                          ),
                        ),
                      ),

                      // Space
                      SizedBox(height: Dimensions.height20),

                      // Password field
                      TextField(
                        controller: passController,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_open_outlined),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: Icon(showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: Dimensions.font17),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide:
                            BorderSide(width: Dimensions.width5/Dimensions.width50, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide(width: Dimensions.width5/Dimensions.width10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            borderSide: BorderSide(width: Dimensions.width5/Dimensions.width10),
                          ),
                        ),
                      ),

                      // Space
                      SizedBox(height: Dimensions.height20),

                      // Remember Me? Forget Pass link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    rememberMe = !rememberMe;
                                  });
                                },
                                child: Icon(rememberMe
                                    ? Icons.check_box_outlined
                                    : Icons.check_box_outline_blank),
                              ),
                              SizedBox(width: Dimensions.width10),
                              const Text('Remember Me'),
                            ],
                          ),

                          //forgotPassword
                          /*TextButton(
                            onPressed: () {},
                            child: const Text('Forgotten Password?'),
                          ),*/
                        ],
                      ),

                      // Space
                      SizedBox(height: Dimensions.height20),

                      // Login btn

                      InkWell(
                        onTap: () {
                          verifyForm();

                          // Get.toNamed(AppRoutes.navBar);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: Dimensions.height50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),

                      // Space
                      SizedBox(height: Dimensions.height20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
