import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';
import 'package:project_oreo/view/success_screen/success_screen.dart';
import 'package:project_oreo/view/summary_screen/widget/material_details_row_card.dart';

// class SummaryScreen extends StatelessWidget {
//   const SummaryScreen(
//       {super.key,
//       this.materialName = '',
//       this.batchNo = '',
//       this.quantity = ''});
//   final String materialName, batchNo, quantity;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 30),
//             Image.asset(
//               ImageConstants.loginOreo,
//               height: 50,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Item',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               padding: EdgeInsets.all(13),
//               decoration: BoxDecoration(
//                 color: ColorConstants.whiteMain,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 1,
//                     blurRadius: 5,
//                     offset: Offset(1, 2), // changes position of shadow
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Center(
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Date',
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: ColorConstants.blackMain),
//                         ),
//                         Text(
//                           'Time',
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: ColorConstants.blackMain),
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           DateFormat('dd/MM/yyyy').format(DateTime.now()),
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: ColorConstants.blackMain),
//                         ),
//                         Text(
//                           DateFormat('hh:mm a').format(DateTime.now()),
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: ColorConstants.blackMain),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 25),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(13),
//                 decoration: BoxDecoration(
//                   color: ColorConstants.whiteMain,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 1,
//                       blurRadius: 5,
//                       offset: Offset(1, 2), // changes position of shadow
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: ListView.builder(
//                   itemCount: 4,
//                   itemBuilder: (context, index) => MaterialDetailsRowCard(
//                     batchNo: batchNo,
//                     materialName: materialName,
//                     quantity: materialName,
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SuccessScreen(),
//                     ));
//               },
//               child: Container(
//                 height: 70,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     image: DecorationImage(
//                         image: AssetImage(ImageConstants.loginBg),
//                         fit: BoxFit.cover)),
//                 child: Center(
//                   child: Text(
//                     'Proceed',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: ColorConstants.whiteMain),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20)
//           ],
//         ),
//       ),
//     );
//   }
// }
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key, required this.products});
  final List<Product> products;

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
            Text(
              'Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: ColorConstants.whiteMain,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                shrinkWrap: true, // Adjust ListView size based on content
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MaterialDetailsRowCard(
                    batchNo: product.batchNo,
                    materialName: product.name,
                    quantity: product.quantity,
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(),
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
    );
  }
}
