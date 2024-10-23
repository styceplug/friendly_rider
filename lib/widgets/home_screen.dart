import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friendly_rider/screens/main_screens/dashboard_screen.dart';
import 'package:friendly_rider/screens/main_screens/messages_screen.dart';
import 'package:friendly_rider/screens/main_screens/notification_screen.dart';
import 'package:friendly_rider/screens/main_screens/setting_screen.dart';
import 'package:friendly_rider/utils/app_constants.dart';
import 'package:friendly_rider/utils/colors.dart';
import 'package:friendly_rider/utils/dimensions.dart';

class HomeScreen extends StatefulWidget {
  final int startingPage;

  const HomeScreen({
    super.key,
    required this.startingPage,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget> [
    const DashboardScreen(),
    const MessagesScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeHomeScreen();
  }

  void initializeHomeScreen() async{
    _onItemTapped(widget.startingPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _pages[_selectedIndex],
          //non Selected
          Positioned(
            bottom: Dimensions.height50,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x26000000),
                    blurRadius: Dimensions.radius45 - 5,
                    offset: const Offset(4, 4),
                    spreadRadius: 0,
                  ),
                ],
                color: AppColors.white,
                border: Border.all(
                  width: Dimensions.width5 / 5,
                  color: AppColors.accentColor.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => _onItemTapped(0),
                    child: Container(
                      height: Dimensions.height40 - 10,
                      width: Dimensions.width40 + 30,
                      color: Colors.white,
                      child: Container(
                        height: Dimensions.height20,
                        width: Dimensions.width20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppConstants.getMenuIcon('home_outlined_icon'),
                            ),
                            scale: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _onItemTapped(1),
                    child: Container(
                      height: Dimensions.height40 - 7,
                      width: Dimensions.width40 + 30,
                      color: Colors.white,
                      child: Container(
                        height: Dimensions.height20,
                        width: Dimensions.width20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppConstants.getMenuIcon('messages_outlined_icon'),
                            ),
                            scale: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _onItemTapped(2),
                    child: Container(
                      height: Dimensions.height40 - 10,
                      width: Dimensions.width40 + 30,
                      color: Colors.white,
                      child: Container(
                        height: Dimensions.height20,
                        width: Dimensions.width20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppConstants.getMenuIcon(
                                  'notification_outlined_icon'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _onItemTapped(3),
                    child: Container(
                      height: Dimensions.height30 - 2,
                      width: Dimensions.width40 + 30,
                      color: Colors.white,
                      child: Container(
                        height: Dimensions.height20,
                        width: Dimensions.width20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppConstants.getMenuIcon('settings_outlined_icon'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ),
          //dashboardSelected
          /* Positioned(
            bottom: Dimensions.height50,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: Dimensions.radius45 - 5,
                      offset: Offset(4, 4),
                      spreadRadius: 0),
                ],
                color: AppColors.white,
                border: Border.all(
                  width: Dimensions.width5 / 5,
                  color: AppColors.accentColor.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: Dimensions.width50+17),
                  Container(
                    height: Dimensions.height40 - 7,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('orders_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('inventory_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height40 - 10,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon(
                                'notification_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('settings_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.height50 + 25,
            left: Dimensions.width50 - 10,
            child: Column(
              children: [
                Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius20 + 5),
                    ),
                  ),
                  child: Container(
                    height: Dimensions.height20,
                    width: Dimensions.width20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        scale: 2,
                        image: AssetImage(
                          AppConstants.getMenuIcon('home_filled_icon'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height5),
                Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
              ],
            ),
          ),*/
          //ordersSelected
          /*Positioned(
            bottom: Dimensions.height50,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: Dimensions.radius45 - 5,
                      offset: Offset(4, 4),
                      spreadRadius: 0),
                ],
                color: AppColors.white,
                border: Border.all(
                  width: Dimensions.width5 / 5,
                  color: AppColors.accentColor.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.height40 - 10,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('home_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width50+17),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('inventory_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height40 - 10,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon(
                                'notification_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('settings_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.height50+6,
            left: Dimensions.width100+12,
            child: Column(
              children: [
                Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius20 + 5),
                    ),
                  ),
                  child: Container(
                    height: Dimensions.height20,
                    width: Dimensions.width20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        scale: 2,
                        image: AssetImage(
                          AppConstants.getMenuIcon('orders_filled_icon'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height5),
                Text(
                  'Orders & \n Customers',
                  style: TextStyle(
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),*/
          //inventorySelected
          /*Positioned(
            bottom: Dimensions.height50,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: Dimensions.radius45 - 5,
                      offset: Offset(4, 4),
                      spreadRadius: 0),
                ],
                color: AppColors.white,
                border: Border.all(
                  width: Dimensions.width5 / 5,
                  color: AppColors.accentColor.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.height40 - 10,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('home_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('orders_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width50+17),
                  Container(
                    height: Dimensions.height40 - 10,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon(
                                'notification_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('settings_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.height50+7,
            left: Dimensions.width100+80,
            child: Column(
              children: [
                Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius20 + 5),
                    ),
                  ),
                  child: Container(
                    height: Dimensions.height20,
                    width: Dimensions.width20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        scale: 2,
                        image: AssetImage(
                          AppConstants.getMenuIcon('inventory_filled_icon'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height5),
                Text(
                  'Products &\nInventory',
                  style: TextStyle(
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),*/
          //notificationsSelected
          /*Positioned(
            bottom: Dimensions.height50,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: Dimensions.radius45 - 5,
                      offset: Offset(4, 4),
                      spreadRadius: 0),
                ],
                color: AppColors.white,
                border: Border.all(
                  width: Dimensions.width5 / 5,
                  color: AppColors.accentColor.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.height40 - 10,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('home_outlined_icon'),
                          ),
                          scale: 1.7,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('orders_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('inventory_outlined_icon'),
                          ),
                          scale: 1.7,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width50+17),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('settings_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.height50 + 25,
            right: Dimensions.width100+20,
            child: Column(
              children: [
                Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius20 + 5),
                    ),
                  ),
                  child: Container(
                    height: Dimensions.height20,
                    width: Dimensions.width20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        scale: 2,
                        image: AssetImage(
                          AppConstants.getMenuIcon('notification_filled_icon'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height5),
                Text(
                  'Alerts',
                  style: TextStyle(
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),*/
          //settingSelected
          /*Positioned(
            bottom: Dimensions.height50,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: Dimensions.radius45 - 5,
                      offset: Offset(4, 4),
                      spreadRadius: 0),
                ],
                color: AppColors.white,
                border: Border.all(
                  width: Dimensions.width5 / 5,
                  color: AppColors.accentColor.withOpacity(0.1),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.height40 - 10,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('home_outlined_icon'),
                          ),
                          scale: 1.7,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('orders_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('inventory_outlined_icon'),
                          ),
                          scale: 1.7,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: Dimensions.height30 - 2,
                    width: Dimensions.width40 + 30,
                    color: Colors.white,
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstants.getMenuIcon('notification_outlined_icon'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width50+17),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.height50 + 25,
            right: Dimensions.width50,
            child: Column(
              children: [
                Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  decoration: ShapeDecoration(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius20 + 5),
                    ),
                  ),
                  child: Container(
                    height: Dimensions.height20,
                    width: Dimensions.width20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        scale: 2,
                        image: AssetImage(
                          AppConstants.getMenuIcon('settings_filled_icon'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height5),
                Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),*/

        ],
      ),
    );
  }
}
