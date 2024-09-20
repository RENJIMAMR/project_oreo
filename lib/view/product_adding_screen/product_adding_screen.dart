import 'package:flutter/material.dart';
import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/dummydb.dart';
import 'package:project_oreo/view/product_adding_screen/widgets/count_increment_rowCard.dart';
import 'package:project_oreo/view/summary_screen/summary_screen.dart';

class ProductAddingScreen extends StatefulWidget {
  final String barcode;

  ProductAddingScreen({super.key, required this.barcode});

  @override
  State<ProductAddingScreen> createState() => _ProductAddingScreenState();
}

class _ProductAddingScreenState extends State<ProductAddingScreen> {
  String barcodeResult = "Scan a barcode";
  final Dummydb db = Dummydb(); // Create an instance of Dummydb
  @override
  Widget build(BuildContext context) {
    // Assuming barcode is the product ID
    final int productId =
        int.tryParse(widget.barcode) ?? -1; // Convert barcode to int

    Product? product;
    try {
      // Get the product based on the scanned barcode
      product = db.getProductById(productId);
    } catch (e) {
      product = null; // Set product to null if not found
    }
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
          product != null
              ? CountIncrementRowcard(
                  imageUrl: product.imageUrl,
                  productName: product.name,
                  quantity: product.quantity,
                  count: product.count,
                )
              : Center(
                  child: Text('No product found for the scanned barcode.'),
                ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryScreen(
                      barcode: barcodeResult,
                    ),
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
