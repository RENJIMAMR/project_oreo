import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/filtering_screen/filtering_screen.dart';
import 'package:project_oreo/view/home_screen/widgets/recent_row_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 27, right: 27, top: 40, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConstants.loginOreo,
                height: 60,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.waving_hand_rounded,
                            color: ColorConstants.amber,
                          )
                        ],
                      ),
                      Text(
                        'Christie Doe',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://images.pexels.com/photos/5847902/pexels-photo-5847902.jpeg?auto=compress&cs=tinysrgb&w=400',
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Your Insights ',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                        color: ColorConstants.blueMain.withOpacity(.08),
                        borderRadius: BorderRadius.circular(26)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: ColorConstants.pink,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                ImageConstants.scanner,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                          Text(
                            'Scan new',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Scanned 0',
                            style: TextStyle(
                                fontSize: 15, color: ColorConstants.greyMain),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FilteringScreen(),
                          ));
                    },
                    child: Container(
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                          color: ColorConstants.blueMain.withOpacity(.08),
                          borderRadius: BorderRadius.circular(26)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: ColorConstants.cyan,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  ImageConstants.viewall,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                            Text(
                              'View All',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Checkouts 0',
                              style: TextStyle(
                                  fontSize: 15, color: ColorConstants.greyMain),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'More',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => RecentRawCard(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: 4)
            ],
          ),
        ),
      ),
    );
  }
}
