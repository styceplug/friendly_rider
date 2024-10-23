import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text('Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.height240,
              width: Dimensions.width240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppConstants.getGifAsset('nothing_ani'),
                  ),
                ),
              ),
            ),
            Text(
              'Nothing to See',
              style: TextStyle(
                  fontSize: Dimensions.font18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
            ),
            Text('Come back some other time', style: TextStyle(
                fontSize: Dimensions.font12,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins'),),

            SizedBox(height: Dimensions.height150),
          ],
        ),
      ),
    );
  }
}
