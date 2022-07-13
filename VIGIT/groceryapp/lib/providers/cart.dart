import 'package:flutter/foundation.dart';
import 'package:groceryapp/models/order.dart';

import '../models/item.dart';
import './orders.dart';
import '../models/billing.dart';

class Cart with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => [..._items];

  void addItem(Item item, int quantity) {
    if (_items.contains(item)) {
      _items.firstWhere((element) => element.id == item.id).quantity +=
          quantity;
    } else {
      _items.add(item);
      _items.firstWhere((element) => element.id == item.id).quantity = quantity;
    }
    notifyListeners();
  }

  void removeItem(Item item) {
    if (_items.firstWhere((element) => element.id == item.id).quantity > 1) {
      _items.firstWhere((element) => element.id == item.id).quantity--;
    } else {
      _items.removeWhere((element) => element.id == item.id);
    }
    notifyListeners();
  }

  Billing getBillingDetails() {
    return Billing(
      id: '123',
      address: '123 Main St',
      totalAmt: _items.fold(
        0,
        (sum, element) => sum + (element.price * element.quantity),
      ),
    );
  }

  void checkOut(Orders orders) {
    double totalAmt = 0.0;
    for (var item in _items) {
      totalAmt += item.price * item.quantity;
    }
    orders.addOrder(
      Order(
        orderNumber: '1234', // TODO: generate a unique id
        date: DateTime.now(),
        items: _items,
        billingDetails: getBillingDetails(),
        orderStatus: OrderStatus.ordered,
      ),
    );
  }
}
