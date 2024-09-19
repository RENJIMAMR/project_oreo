import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';

class RecentRawCard extends StatelessWidget {
  const RecentRawCard({super.key});

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Raw Material',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                'Recent',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 50,
                height: 17,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstants.darkpink),
                child: Center(
                  child: Text(
                    'Report',
                    style: TextStyle(
                        fontSize: 11, color: ColorConstants.whiteMain),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConstants.whiteMain),
                child: Center(
                  child: Text(
                    '6 Bags',
                    style: TextStyle(
                        fontSize: 14, color: ColorConstants.blackMain),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
