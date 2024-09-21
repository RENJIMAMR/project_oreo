import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import 'package:project_oreo/view/dummydb.dart';
import 'package:project_oreo/view/product_adding_screen/widgets/count_increment_rowCard.dart';
import 'package:project_oreo/view/summary_screen/summary_screen.dart';

// class ProductAddingScreen extends StatefulWidget {
//   final String barcode;

//   ProductAddingScreen({super.key, required this.barcode});

//   @override
//   State<ProductAddingScreen> createState() => _ProductAddingScreenState();
// }

// class _ProductAddingScreenState extends State<ProductAddingScreen> {
//   String barcodeResult = "Scan a barcode";
//   final Dummydb db = Dummydb(); // Create an instance of Dummydb
//   @override
//   Widget build(BuildContext context) {
//     // Assuming barcode is the product ID
//     final int productId =
//         int.tryParse(widget.barcode) ?? -1; // Convert barcode to int

//     Product? product;
//     try {
//       // Get the product based on the scanned barcode
//       product = db.getProductById(productId);
//     } catch (e) {
//       product = null; // Set product to null if not found
//     }
//     return Scaffold(
//         body: Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Image.asset(
//             ImageConstants.loginOreo,
//             height: 50,
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Row(
//             children: [
//               Text(
//                 'Item',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Spacer(),
//               Text(
//                 'Add more',
//                 style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                     color: ColorConstants.blueMain),
//               ),
//             ],
//           ),
//           product != null
//               ? CountIncrementRowcard(
//                   imageUrl: product.imageUrl,
//                   productName: product.name,
//                   quantity: product.quantity,
//                   count: product.count,
//                 )
//               : Center(
//                   child: Text('No product found for the scanned barcode.'),
//                 ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SummaryScreen(
//                       batchNo: product?.batchNo ?? "",
//                       materialName: product?.name ?? '',
//                       quantity: product?.quantity ?? '',
//                     ),
//                   ));
//             },
//             child: Container(
//               height: 70,
//               // width: 175,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                       image: AssetImage(ImageConstants.loginBg),
//                       fit: BoxFit.cover)),
//               child: Center(
//                 child: Text(
//                   'Proceed',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: ColorConstants.whiteMain),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           )
//         ],
//       ),
//     ));
//   }
// }
class ProductAddingScreen extends StatefulWidget {
  final String barcode;

  ProductAddingScreen({super.key, required this.barcode});

  @override
  State<ProductAddingScreen> createState() => _ProductAddingScreenState();
}

class _ProductAddingScreenState extends State<ProductAddingScreen> {
  String barcodeResult = "Scan a barcode";
  final Dummydb db = Dummydb(); // Create an instance of Dummydb
  List<Product> selectedProducts = [];

  @override
  Widget build(BuildContext context) {
    // Assuming barcode is the product ID
    final int productId =
        int.tryParse(widget.barcode) ?? -1; // Convert barcode to int

    Product? product;
    try {
      // Get the product based on the scanned barcode
      product = db.getProductById(productId);
      if (product != null && !selectedProducts.contains(product)) {
        selectedProducts.add(product);
      }
    } catch (e) {
      product = null; // Set product to null if not found
    }

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
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
            product != null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: selectedProducts.length,
                    itemBuilder: (context, index) => CountIncrementRowcard(
                      imageUrl: product?.imageUrl ?? '',
                      productName: product?.name ?? '',
                      quantity: product?.quantity ?? '',
                      count: product?.count ?? 0,
                    ),
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
                        products: selectedProducts,
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
      ),
    ));
  }
}
