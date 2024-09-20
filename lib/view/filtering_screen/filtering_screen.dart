import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/filtering_screen/widget/quantity_row_card.dart';
import 'package:project_oreo/view/summary_screen/summary_screen.dart';

class FilteringScreen extends StatefulWidget {
  const FilteringScreen({super.key});

  @override
  State<FilteringScreen> createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen> {
  String barcodeResult = "Scan a barcode";
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
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = true;
                      isnotSelected = false;
                    });
                  },
                  child: isSelected
                      ? Container(
                          height: 50,
                          width: 175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(ImageConstants.loginBg),
                                  fit: BoxFit.cover)),
                          child: Center(
                            child: Text(
                              'Product',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.whiteMain),
                            ),
                          ),
                        )
                      : Container(
                          height: 50,
                          width: 175,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset:
                                    Offset(1, 2), // changes position of shadow
                              ),
                            ],
                            color: ColorConstants.whiteMain,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Product ',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.blackMain),
                            ),
                          ),
                        ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      setState(() {
                        isnotSelected = false;
                      });
                    },
                    child: isnotSelected
                        ? Container(
                            height: 50,
                            width: 175,
                            decoration: BoxDecoration(
                              color: ColorConstants.whiteMain,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      1, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Raw materials',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.blackMain),
                              ),
                            ),
                          )
                        : Container(
                            height: 50,
                            width: 175,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(ImageConstants.loginBg),
                                    fit: BoxFit.cover)),
                            child: Center(
                              child: Text(
                                'Raw materials',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.whiteMain),
                              ),
                            ),
                          ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
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
                        builder: (context) => SummaryScreen(
                          barcode: barcodeResult,
                        ),
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
        ),
      ),
    );
  }
}
