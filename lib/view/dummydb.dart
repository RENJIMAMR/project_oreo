import 'package:project_oreo/model/product_model.dart';
import 'package:project_oreo/utils/constants/image_constants.dart';

class Dummydb {
  final List<Product> products = [
    Product(id: 1, imageUrl: ImageConstants.oreopic, name: 'Oreo 1', count: 1),
    Product(id: 2, imageUrl: ImageConstants.oreopic, name: 'Oreo 2', count: 2),
    Product(id: 3, imageUrl: ImageConstants.oreopic, name: 'Oreo 3', count: 3),
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
