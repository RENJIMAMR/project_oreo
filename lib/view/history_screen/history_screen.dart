import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/history_screen/widget/ingredient_added_rowCard.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
          // SizedBox(
          //   height: 180,
          // ),
          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         ImageConstants.addItem,
          //         height: 170,
          //         fit: BoxFit.cover,
          //       ),
          //       SizedBox(
          //         height: 15,
          //       ),
          //       Text(
          //         'You don’t have any documents',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Text(
          //         'Sync docs accross smartphones, tablets, and computers',
          //         style: TextStyle(
          //           fontSize: 13,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Recently added',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => IngredientAddedRowcard(),
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: 4,
            ),
          )
        ],
      ),
    ));
  }
}
