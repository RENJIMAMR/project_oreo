// import 'package:flutter/material.dart';
// import 'package:project_oreo/model/product_model.dart';

// import 'package:project_oreo/view/dummydb.dart';

// class ScanningScreen extends StatefulWidget {
//   final String barcode;

//   ScanningScreen({super.key, required this.barcode});

//   @override
//   State<ScanningScreen> createState() => _ScanningScreenState();
// }

// class _ScanningScreenState extends State<ScanningScreen> {
//   final Dummydb db = Dummydb();
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
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: product != null
//           ? ListTile(
//               leading: Image.asset(product.imageUrl,
//                   width: 50, height: 50, fit: BoxFit.cover),
//               title: Text(product.name),
//               subtitle: Text('Count: ${product.count}'),
//               trailing: Text('ID: ${product.id}'),
//             )
//           : Center(
//               child: Text('No product found for the scanned barcode.'),
//             ),
//     );
//   }
// }
