import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:project_oreo/view/home_screen/home_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              ImageConstants.loginOreo,
              height: 50,
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstants.verified,
                    height: 220,
                    width: 220,
                  ),
                  Text(
                    'Item added succesfully',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavBarScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 50,
                        // width: 175,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(ImageConstants.loginBg),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Text(
                            'Back to home',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.whiteMain),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BottomNavBarScreen(selectedIndex: 1),
                        ),
                        (route) =>
                            false, // This will clear the stack and take the user back to Home.
                      );
                    },
                    child: Text(
                      'Add more',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.blueMain),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
