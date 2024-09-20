import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/filtering_screen/filtering_screen.dart';
import 'package:project_oreo/view/home_screen/widgets/recent_row_card.dart';
import 'package:project_oreo/view/scanning_screen/scanning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String barcodeResult = "Scan a barcode"; // Default message for the result

// Method to scan barcode
  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan(); // Start the barcode scanner
      setState(() {
        barcodeResult = result.rawContent; // Store the result in state
      });
    } catch (e) {
      setState(() {
        barcodeResult = "Failed to scan barcode: $e";
      });
    }
  }

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
                height: 50,
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
                                fontSize: 20, fontWeight: FontWeight.bold),
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
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(ImageConstants.profilePic2))),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Your Insights ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BarcodeScanner();
                        if (barcodeResult.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScanningScreen(barcode: barcodeResult),
                            ),
                          );
                          print(barcodeResult);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    // Navigate to the next screen after a successful scan

                                    ScanningScreen(
                                  barcode: barcodeResult,
                                ),
                              ));
                        }
                      },
                      child: Container(
                        height: 180,
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
                                    fontSize: 15,
                                    color: ColorConstants.greyMain),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilteringScreen(),
                            ));
                      },
                      child: Container(
                        height: 180,
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
                                    fontSize: 15,
                                    color: ColorConstants.greyMain),
                              ),
                            ],
                          ),
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
