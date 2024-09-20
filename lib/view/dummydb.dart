import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';

class Dummydb {
  final List<Product> products = [
    Product(
        id: 1,
        imageUrl: ImageConstants.eggs,
        name: 'Eggs',
        count: 1,
        quantity: '100 No.s',
        batchNo: 'AB12654'),
    Product(
        id: 2,
        imageUrl: ImageConstants.flour,
        name: 'Flour',
        count: 1,
        quantity: '200 Kg',
        batchNo: 'AB12654'),
    Product(
        id: 3,
        imageUrl: ImageConstants.butter,
        name: 'Baking Fat',
        count: 1,
        quantity: '25 Kg',
        batchNo: 'AB12654'),
    Product(
        id: 3,
        imageUrl: ImageConstants.sugar,
        name: 'Sugar',
        count: 1,
        quantity: '50 Kg',
        batchNo: 'AB12654'),

    // Add more products as needed
  ];

  Product getProductById(int id) {
    return products.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception(
          'Product not found'), // Throw an exception if not found
    );
  }
}
