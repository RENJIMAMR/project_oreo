import 'package:project_oreo/model/product_model.dart';

class Dummydb {
  final List<Product> products = [
    Product(
        id: 1,
        imageUrl: "https://example.com/image1.jpg",
        name: 'Oreo 1',
        count: 1),
    Product(
        id: 2,
        imageUrl: "https://example.com/image2.jpg",
        name: 'Oreo 2',
        count: 2),
    Product(
        id: 3,
        imageUrl: "https://example.com/image3.jpg",
        name: 'Oreo 3',
        count: 3),
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
