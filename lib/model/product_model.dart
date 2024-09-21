import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String quantity;
  @HiveField(4)
  final String batchNo;
  @HiveField(5)
  int count;

  ProductModel(
      {required this.id,
      required this.quantity,
      required this.imageUrl,
      required this.name,
      required this.count,
      required this.batchNo});
}
