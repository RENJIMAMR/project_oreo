import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/view/filtering_screen/widget/quantity_row_card.dart';
import 'package:project_oreo/view/summary_screen/summary_screen.dart';

class Productstab extends StatelessWidget {
  const Productstab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search_rounded,
                color: ColorConstants.greyMain.withOpacity(.5),
              ),
              hintText: 'Search',
              hintStyle:
                  TextStyle(color: ColorConstants.greyMain, fontSize: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: ColorConstants.greyMain.withOpacity(.1),
                      width: 1))),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryScreen(),
                  ));
            },
            child: ListView.separated(
              itemBuilder: (context, index) => QuantityRowCard(),
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: 4,
            ),
          ),
        ),
      ],
    );
  }
}
