import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/filtering_screen/tabs/productstab.dart';
import 'package:project_oreo/view/filtering_screen/tabs/raw_materialtab.dart';
import 'package:project_oreo/view/filtering_screen/widget/quantity_row_card.dart';
import 'package:project_oreo/view/summary_screen/summary_screen.dart';

class FilteringScreen extends StatefulWidget {
  const FilteringScreen({super.key});

  @override
  State<FilteringScreen> createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen> {
  bool isSelected = false; //to change bg of product and raw materials
  bool isnotSelected = true;

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
              height: 20,
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: ColorConstants.blackMain,
                    indicatorColor: ColorConstants.blackMain,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Raw materials',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20, // Add space between TabBar and TabBarView
                  ),
                  SizedBox(
                    height:
                        300, // Set a height for TabBarView to avoid using Expanded
                    child: TabBarView(
                      children: [
                        Productstab(),
                        RawMaterialTab(),
                      ],
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
