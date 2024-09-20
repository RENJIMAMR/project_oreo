import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';

//row card for product increment screen
class CountIncrementRowcard extends StatelessWidget {
  const CountIncrementRowcard(
      {super.key,
      required this.imageUrl,
      required this.quantity,
      required this.productName,
      this.count = 1});
  final String imageUrl, quantity, productName;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 80,
      decoration: BoxDecoration(
          color: ColorConstants.containergrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quantity,
                style: TextStyle(fontSize: 15, color: ColorConstants.greyMain),
              ),
              Text(
                productName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          Container(
            // width: 70,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.whiteMain),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.remove,
                      color: ColorConstants.blueMain,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(
                        fontSize: 25,
                        color: ColorConstants.blackMain,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      color: ColorConstants.blueMain,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
