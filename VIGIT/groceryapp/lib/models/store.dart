/// [Store] model contains [id], [name], [description], [category], [image] and [rating] of each Store.
/// Each store has a list of [Item]s that it sells.

import 'package:groceryapp/models/item.dart';

import './categories.dart';

class Store {
  const Store({
    required this.id,
    required this.name,
    this.description = '',
    required this.category,
    required this.image,
    this.rating = 0.0,
    required this.ratingCount,
    this.products = const <Item>[],
    this.deliveryTime = 'NA',
    this.minOrder = 'NA',
    this.timings = 'NA',
  });

  final String id;
  final String name;
  final String description;
  final Categories category;
  final String image;
  final double rating;
  final int ratingCount;
  final List<Item> products;
  final String deliveryTime;
  final String minOrder;
  final String timings;

  void addProduct(Item item) {
    products.add(item);
  }

  /// [Store.fromJson] converts a JSON object to a [Store] object.
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: Categories.values[json['category']],
      image: json['image'],
      rating: json['rating'],
      ratingCount: json['ratingCount'],
      deliveryTime: json['deliveryTime'],
      minOrder: json['minOrder'],
      timings: json['timings'],
    );
  }
}
