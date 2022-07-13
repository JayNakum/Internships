/// [Item] model stores the order items.

class Item {
  Item({
    required this.id,
    required this.name,
    required this.storeName,
    required this.image,
    required this.price,
    this.quantity = 1,
    this.itemProperties = const <String, String>{},
  });

  final String id;
  final String name;
  final String storeName;
  final String image;
  final double price;
  int quantity;
  final Map<String, String> itemProperties;

  /// [Item.fromJson] converts a JSON object to a [Item] object.
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      storeName: json['storeName'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
