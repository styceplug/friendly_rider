import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        elevation: 1,
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
