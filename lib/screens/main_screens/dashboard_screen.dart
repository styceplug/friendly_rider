import 'package:flutter/material.dart';
import 'package:friendly_rider/routes/routes.dart';
import 'package:friendly_rider/screens/main_screens/notification_screen.dart';
import 'package:friendly_rider/utils/app_constants.dart';
import 'package:friendly_rider/utils/colors.dart';
import 'package:friendly_rider/utils/dimensions.dart';
import 'package:friendly_rider/widgets/custom_switch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool _enable = false;

  String greeting = 'Hello,';
  String lastUpdated = '';

  @override
  void initState() {
    super.initState();
    initializePage();
  }

  void initializePage() async {
    setGreeting();
    updateLastUpdated();
  }

  void setGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 6) {
      greeting = 'Why are you still up? Huh? 🌒';
    } else if (hour < 12) {
      greeting = 'Good Morning Rider ☀️, Drive safe today ';
    } else if (hour < 17) {
      greeting =
      'Good Afternoon Rider ☀️, Hope the day is as bright as your Smile ';
    } else if (hour < 22) {
      greeting =
      'Good Evening Rider 🌇, about time we round up for the day ';
    } else {
      greeting = 'Working late, huh? 🌜';
    }
    setState(() {});
  }

  String getLastUpdatedTimestamp() {
    DateTime now = DateTime.now();
    String formatted = DateFormat('hh:mm a, dd MMM, yyyy').format(now);
    return 'Last updated: $formatted';
  }

  void updateLastUpdated() {
    setState(() {
      lastUpdated = getLastUpdatedTimestamp();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: Dimensions.height50 + Dimensions.height20),
          //marque
          Container(
            alignment: Alignment.centerLeft,
            color: AppColors.primaryColor,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width25, vertical: Dimensions.height5),
            height: Dimensions.height30,
            width: double.maxFinite,
            child: Marquee(
              text: greeting,
              blankSpace: Dimensions.width167,
              // numberOfRounds: 5,
              startPadding: 5.0,
              pauseAfterRound: const Duration(seconds: 3),
              style: TextStyle(
                  color: AppColors.white, fontSize: Dimensions.font14),
            ),
          ),
          //body
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin:
                EdgeInsets.symmetric(horizontal: Dimensions.width20 + 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.height20),
                    //header
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // welcome back and Administrator Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: Dimensions.font16),
                              ),
                              Text(
                                'Oluwaferanmi',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dimensions.font18,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),

                          // header img
                          Container(
                            height: Dimensions.height40,
                            width: Dimensions.width40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AppConstants.getPngAsset('profile_head'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //space
                    SizedBox(height: Dimensions.height20),

                   /* //dashboard text
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),*/

                    //space
                    SizedBox(height: Dimensions.height20),
                    //availability switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Set availabilty',style: TextStyle(fontSize: Dimensions.font20),),
                        CustomSwitch(value: _enable, onChanged: (bool val){
                          setState(() {
                            _enable = val;
                          });
                        })
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    //first Row
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height50 + Dimensions.height15,
                      decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 40,
                            offset: Offset(4, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: Dimensions.width5),
                          Container(
                            height: Dimensions.height30,
                            width: Dimensions.width30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AppConstants.getPngAsset('user_head'),
                                ),
                              ),
                            ),
                          ),
                          const Text('Total Completed Orders'),
                          SizedBox(width: Dimensions.width20),
                          Text(
                            '250',
                            style: TextStyle(
                                fontSize: Dimensions.font18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: Dimensions.width20),
                        ],
                      ),
                    ),

                    //space
                    SizedBox(height: Dimensions.height20),

                    //today's Summary
                    Text(
                      'Today\'s Summary',
                      style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(
                      height: Dimensions.height240 + Dimensions.height10,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.width28,
                          vertical: Dimensions.height20),
                      decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius10),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 30,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius10),
                                    side: BorderSide(width: Dimensions.width5/Dimensions.width100),
                                  ),
                                  color: AppColors.white,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4 / 3),
                                      blurRadius: 94,
                                      offset: const Offset(0, 21),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                height: Dimensions.height70 + Dimensions.width20,
                                width: Dimensions.width100*1.5,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Orders Completed',
                                      style: TextStyle(
                                        color: const Color(0xFF92A2AB),
                                        fontSize: Dimensions.font13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height5),
                                    Text(
                                      '25',
                                      style: TextStyle(
                                          color: AppColors.accentColor,
                                          fontSize: Dimensions.font22,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: ShapeDecoration(
                                  color: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius10),
                                    side: BorderSide(width: Dimensions.width5/Dimensions.width100),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4 / 3),
                                      blurRadius: 94,
                                      offset: const Offset(0, 21),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                height: Dimensions.height70 + Dimensions.width20,
                                width: Dimensions.width100*1.5,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Orders Cancelled',
                                      style: TextStyle(
                                        color: const Color(0xFF92A2AB),
                                        fontSize: Dimensions.font13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.height5),
                                    Text(
                                      '4',
                                      style: TextStyle(
                                          color: AppColors.accentColor,
                                          fontSize: Dimensions.font22,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.height10),
                          Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius10),
                                side: BorderSide(width: Dimensions.width5/Dimensions.width100),
                              ),
                              color: AppColors.white,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4 / 3),
                                  blurRadius: 94,
                                  offset: const Offset(0, 21),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            height: Dimensions.height70 + Dimensions.width20,
                            width: double.maxFinite,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                    color: const Color(0xFF92A2AB),
                                    fontSize: Dimensions.font13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: Dimensions.height5),
                                Row(
                                  children: [
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                          color: AppColors.accentColor,
                                          fontSize: Dimensions.font22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Icon(Icons.star,color: Colors.yellow),
                                    const Icon(Icons.star,color: Colors.yellow),
                                    const Icon(Icons.star,color: Colors.yellow),
                                    const Icon(Icons.star,color: Colors.yellow),
                                    const Icon(Icons.star_border_outlined,color: Colors.yellow),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),

                    //recentUpdates
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Updates',
                          style: TextStyle(
                            fontSize: Dimensions.font18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        InkWell(
                          onTap: () {Get.toNamed(AppRoutes.notificationScreen);},
                          child: Text(
                            'More',
                            style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //Alerts
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20),
                              width: double.maxFinite,
                              height: Dimensions.height100 - Dimensions.height5,
                              child: Row(
                                children: [
                                  //cart_icon
                                  Container(
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          width: Dimensions.width5 / 10,
                                          color: AppColors.accentColor
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    height: Dimensions.height40,
                                    width: Dimensions.width40,
                                    child: Icon(
                                      Icons.shopping_cart,
                                      size: Dimensions.iconSize20,
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width10),
                                  //text_alert
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'New Order',
                                        style: TextStyle(
                                            fontSize: Dimensions.font17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                            color: AppColors.accentColor),
                                      ),
                                      Text(
                                        'Oluwaferanmi just placed a NEW ORDER',
                                        style: TextStyle(
                                          fontSize: Dimensions.font13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.accentColor
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height15),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20),
                              width: double.maxFinite,
                              height: Dimensions.height100 - Dimensions.height5,
                              child: Row(
                                children: [
                                  //cart_icon
                                  Container(
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          width: Dimensions.width5/Dimensions.width10,
                                          color: AppColors.accentColor
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    height: Dimensions.height40,
                                    width: Dimensions.width40,
                                    child: Icon(
                                      Icons.directions_car,
                                      size: Dimensions.iconSize20,
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width10),
                                  //text_alert
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Completed Orders',
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                              fontSize: Dimensions.font17,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Poppins',
                                              color: AppColors.accentColor),
                                        ),
                                        Text(
                                          'Order 10101 has been marked as Completed',
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontSize: Dimensions.font13,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.accentColor
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height15),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20),
                              width: double.maxFinite,
                              height: Dimensions.height100-Dimensions.height10,
                              child: Row(
                                children: [
                                  //cart_icon
                                  Container(
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          width: Dimensions.width5/Dimensions.width10,
                                          color: AppColors.accentColor
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ),
                                    height: Dimensions.height40,
                                    width: Dimensions.width40,
                                    child: Icon(
                                      Icons.cancel,
                                      size: Dimensions.iconSize20,
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width10),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Order Cancelled',
                                        style: TextStyle(
                                            fontSize: Dimensions.font17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                            color: AppColors.accentColor),
                                      ),
                                      Text(
                                        'Oluwaferanmi cancelled his ORDER',
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: Dimensions.font13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.accentColor
                                              .withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height150),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
