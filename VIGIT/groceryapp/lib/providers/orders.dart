import 'package:flutter/foundation.dart';
import 'package:groceryapp/models/order.dart';

import '../models/billing.dart';
import '../models/item.dart';

class Orders with ChangeNotifier {
  /// [_orders] is a list (fetched from database). It contains the details of all stores.
  final List<Order> _orders = <Order>[];

  /// [_filteredOrders] contains the details of all orders that match the search query and the applied filters.
  /// By default [_filteredOrders] is equal to [_orders].
  final List<Order> _filteredOrders = [];

  final Map<String, bool> filters = {
    'Sort by: New to Old': false,
    'Sort by: Old to New': false,
  };

  List<Order> get orders => _filteredOrders;

  void fetchAndSetOrders() {
    _orders.clear();
    _orders.addAll(<Order>[
      Order(
        orderNumber: '12345',
        billingDetails: const Billing(
          id: 'bill_1',
          totalAmt: 230.0,
          discountAmt: 25.0,
          address: '123 Main St, New York, NY 10001',
        ),
        date: DateTime.now().add(const Duration(days: -1)),
        items: <Item>[
          Item(
            id: '1',
            name: 'Amul Milk',
            storeName: 'Store 1',
            price: 50.0,
            quantity: 2,
            image:
                'https://neareshop.s3.ap-south-1.amazonaws.com/2020/11/Amul-Moti-Homogenised-Toned-Long-Life-Milk-500ml-Esl-Pouch-New.jpg',
          ),
          Item(
            id: '2',
            name: 'Red Capsicum',
            storeName: 'Store 1',
            price: 180.0,
            quantity: 2,
            image:
                'https://patnakart.in/wp-content/uploads/2021/07/bell_pepper_red.jpg',
          ),
        ],
        orderStatus: OrderStatus.onTheWay,
      ),
      Order(
        orderNumber: '12346',
        billingDetails: const Billing(
          id: 'bill_2',
          totalAmt: 50.0,
          deliveryFees: 80.0,
          address: '123 Main St, New York, NY 10001',
        ),
        date: DateTime.now(),
        items: <Item>[
          Item(
            id: '1',
            name: 'Amul Milk',
            storeName: 'Store 2',
            price: 50.0,
            quantity: 2,
            image:
                'https://neareshop.s3.ap-south-1.amazonaws.com/2020/11/Amul-Moti-Homogenised-Toned-Long-Life-Milk-500ml-Esl-Pouch-New.jpg',
          ),
        ],
        orderStatus: OrderStatus.delivered,
      ),
    ]);

    _filteredOrders.clear();
    _filteredOrders.addAll(_orders);
    notifyListeners();
  }

  void addOrder(Order order) {
    _orders.add(order);
    _filteredOrders.add(order);
    notifyListeners();
  }

  // Order getOrderByOrderNumber(String orderNumber) =>
  //     _orders.firstWhere((order) => order.orderNumber == orderNumber);

  void applyFilter(String filterName) {
    if (filters[filterName] ?? false) {
      filters.update(filterName, (value) => false);

      switch (filterName) {
        case 'test':
          _filteredOrders.clear();
          break;
        default:
          _filteredOrders.clear();
          _filteredOrders.addAll(_orders);
          break;
      }
    } else {
      filters.update(filterName, (value) => true);

      switch (filterName) {
        case 'Sort by: New to Old':
          _filteredOrders.sort((a, b) => b.date.compareTo(a.date));
          break;
        case 'Sort by: Old to New':
          _filteredOrders.sort((a, b) => a.date.compareTo(b.date));
          break;

        default:
          _filteredOrders.clear();
          _filteredOrders.addAll(_orders);
          break;
      }
    }
    notifyListeners();
  }
}
