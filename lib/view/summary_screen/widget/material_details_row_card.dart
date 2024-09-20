import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';

class MaterialDetailsRowCard extends StatelessWidget {
  const MaterialDetailsRowCard(
      {super.key,
      required this.materialName,
      required this.batchNo,
      required this.quantity});
  final String materialName, batchNo, quantity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Raw material name',
                  style:
                      TextStyle(fontSize: 15, color: ColorConstants.blackMain),
                ),
                Text(
                  'Batch No',
                  style:
                      TextStyle(fontSize: 15, color: ColorConstants.blackMain),
                ),
                Text(
                  'Quantity',
                  style:
                      TextStyle(fontSize: 15, color: ColorConstants.blackMain),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  materialName,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.blackMain),
                ),
                Text(
                  batchNo,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.blackMain),
                ),
                Text(
                  quantity,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.blackMain),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          endIndent: 10,
          indent: 10,
          color: ColorConstants.blackMain,
          thickness: 1,
        )
      ],
    );
  }
}
