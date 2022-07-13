import 'package:groceryapp/models/billing.dart';

import './item.dart';

/// [OrderStatus] is an enum that contains various [Order] statuses.
enum OrderStatus {
  ordered,
  processing,
  confirmed,
  onTheWay,
  delivered,
  rejected,
  returned;

  @override
  String toString() {
    switch (this) {
      case OrderStatus.ordered:
        return 'Ordered';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.onTheWay:
        return 'On the way';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.rejected:
        return 'Rejected';
      case OrderStatus.returned:
        return 'Returned';
      default:
        return toString();
    }
  }
}

/// [RefundStatus] is an enum that contains various [Order] refund statuses.
enum RefundStatus {
  none,
  requested,
  approved,
  rejected,
  done;

  @override
  String toString() {
    switch (this) {
      case RefundStatus.none:
        return 'None';
      case RefundStatus.requested:
        return 'Requested';
      case RefundStatus.approved:
        return 'Approved';
      case RefundStatus.rejected:
        return 'Rejected';
      case RefundStatus.done:
        return 'Done';
      default:
        return toString();
    }
  }
}

/// [Order] model stores the order details.
/// It stores the order items as a list of [Item] model.
/// It also contains [Billing] model to store billing details.
/// [Order] model also contains the order status in [OrderStatus] and [RefundStatus].
class Order {
  const Order({
    required this.orderNumber,
    required this.date,
    required this.items,
    required this.billingDetails,
    required this.orderStatus,
    this.refundStatus = RefundStatus.none,
  });

  final String orderNumber;
  final DateTime date;
  final List<Item> items;
  final Billing billingDetails;
  final OrderStatus orderStatus;
  final RefundStatus refundStatus;

  /// [Order.fromJson] converts a JSON object to a [Order] object.
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderNumber: json['orderNumber'],
      date: DateTime.parse(json['date']),
      items: (json['items'] as List<dynamic>)
          .map((item) => Item.fromJson(item))
          .toList(),
      billingDetails: Billing.fromJson(json['billingDetails']),
      orderStatus: OrderStatus.values[json['orderStatus']],
      refundStatus: RefundStatus.values[json['refundStatus']],
    );
  }
}
