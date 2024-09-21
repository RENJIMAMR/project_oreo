import 'package:flutter/material.dart';
import 'package:project_oreo/controller/item_count_controller.dart';
import 'package:project_oreo/controller/scan_controller.dart';
import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:project_oreo/view/dummydb.dart';
import 'package:project_oreo/view/product_adding_screen/widgets/count_increment_rowCard.dart';
import 'package:project_oreo/view/summary_screen/summary_screen.dart';
import 'package:provider/provider.dart';

class ProductAddingScreen extends StatefulWidget {
  final String barcode;

  ProductAddingScreen({super.key, required this.barcode});

  @override
  State<ProductAddingScreen> createState() => _ProductAddingScreenState();
}

class _ProductAddingScreenState extends State<ProductAddingScreen> {
  String barcodeResult = "Scan a barcode";

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<ItemCountController>().getAllCartItems();
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Assuming barcode is the product ID
    final int productId =
        int.tryParse(widget.barcode) ?? -1; // Convert barcode to int

    ProductModel? product;
    try {
      // Get the product based on the scanned barcode
      // product = db.getProductById(productId);
      // if (product != null && !selectedProducts.contains(product)) {
      //   selectedProducts.add(product);
      // }
    } catch (e) {
      product = null; // Set product to null if not found
    }

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Consumer<ScanController>(
            builder: (context, scannerProvider, child) {
          return Column(
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
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BottomNavBarScreen(selectedIndex: 1),
                        ),
                        (route) =>
                            false, // This will clear the stack and take the user back to Home.
                      );
                    },
                    child: Text(
                      'Add more',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.blueMain),
                    ),
                  ),
                ],
              ),
              scannerProvider.scannedItems.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: scannerProvider.scannedItems.length,
                      itemBuilder: (context, index) {
                        final listItem = scannerProvider.scannedItems[index];
                        return CountIncrementRowcard(
                            imageUrl: listItem?.imageUrl ?? '',
                            productName: listItem?.name ?? '',
                            quantity: listItem?.quantity ?? '',
                            count: listItem?.count ?? 0,
                            onDecrement: () {
                              // context
                              //     .read<ItemCountController>()
                              //     .decrementQty(countProv.keys[index]);
                            },
                            onIncrement: () {});
                      })
                  : Center(
                      child: Text('No product found for the scanned barcode.'),
                    ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SummaryScreen(
                          products: scannerProvider.scannedItems,
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
          );
        }),
      ),
    ));
  }
}
