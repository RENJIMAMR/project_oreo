class Product {
  final int id;
  final String imageUrl;
  final String name;
  final String quantity;
  final String batchNo;

  final int count;

  Product(
      {required this.id,
      required this.quantity,
      required this.imageUrl,
      required this.name,
      required this.count,
      required this.batchNo});
}
