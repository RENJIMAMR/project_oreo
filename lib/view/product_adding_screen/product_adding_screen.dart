import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/product_adding_screen/widgets/count_increment_rowCard.dart';
import 'package:project_oreo/view/summary_screen/summary_screen.dart';

class ProductAddingScreen extends StatefulWidget {
  const ProductAddingScreen({super.key});

  @override
  State<ProductAddingScreen> createState() => _ProductAddingScreenState();
}

class _ProductAddingScreenState extends State<ProductAddingScreen> {
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
            height: 40,
          ),
          Row(
            children: [
              Text(
                'Item',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                'Add more',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.blueMain),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CountIncrementRowcard(),
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: 4,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryScreen(),
                  ));
            },
            child: Container(
              height: 70,
              // width: 175,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.loginBg),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  'Proceed',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.whiteMain),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
