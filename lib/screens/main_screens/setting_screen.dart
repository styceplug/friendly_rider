import 'package:flutter/material.dart';
import 'package:friendly_rider/routes/routes.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: Dimensions.width40, vertical: Dimensions.height20),
          child: Column(
            children: [
              SizedBox(
                width: Dimensions.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //avatar
                        Container(
                          height: Dimensions.height20 * 3,
                          width: Dimensions.width20 * 3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AppConstants.getPngAsset('avatar'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width24),
                        //userinfo
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              'Oluwaferanmi O.',
                              style: TextStyle(
                                fontSize: Dimensions.font16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            //phone
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: Dimensions.iconSize16,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text(
                                  '234 806 7000 178',
                                  style: TextStyle(
                                      fontSize: Dimensions.font12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.accentColor),
                                ),
                              ],
                            ),
                            //mail
                            Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  size: Dimensions.iconSize16,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                Text(
                                  'admin@friendly.com',
                                  style: TextStyle(
                                      fontSize: Dimensions.font12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.accentColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: Dimensions.width50 + Dimensions.width30),
                        Container(
                          height: Dimensions.height20 * 2,
                          width: Dimensions.width20 * 2,
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20,
                              vertical: Dimensions.height20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                AppConstants.getPngAsset('pen_icon'),
                              ),
                              scale: 2.5,
                            ),
                            color: AppColors.primaryColor,
                            borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    //logout btn
                    InkWell(
                      onTap: () {
                        logout();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimensions.height50,
                        // width: Dimensions.width100 * 3,
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          border: Border.all(
                            width: Dimensions.width5/Dimensions.width10,
                            color: AppColors.accentColor.withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(
                              Dimensions.radius10 * 1.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.exit_to_app,
                              color: AppColors.primaryColor,size: Dimensions.iconSize24,),
                            Text(
                              'Logout',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font15,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                    ),


                    // privacy, tos

                    SizedBox(height: Dimensions.height30),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.privacyPolicyScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20),
                        alignment: Alignment.centerLeft,
                        height: Dimensions.height50 + Dimensions.height10,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: Dimensions.font15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColors.accentColor,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: Dimensions.iconSize16),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.termsOfService);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20),
                        alignment: Alignment.centerLeft,
                        height: Dimensions.height50+Dimensions.height10,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.bgColor,
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Terms of Services',
                              style: TextStyle(
                                fontSize: Dimensions.font15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: AppColors.accentColor,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: Dimensions.iconSize16),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height150),
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
