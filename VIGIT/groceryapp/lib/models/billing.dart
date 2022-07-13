/// [Billing] model stores the billing details.

class Billing {
  const Billing({
    required this.id,
    required this.totalAmt,
    this.deliveryFees = 0.0,
    this.taxAmt = 0.0,
    this.discountAmt = 0.0,
    required this.address,
  });

  final String id;
  final double totalAmt;
  final double deliveryFees;
  final double taxAmt;
  final double discountAmt;
  final String address;

  /// [grandTotal] returns the total amount of the order.
  double get grandTotal => totalAmt + deliveryFees + taxAmt - discountAmt;

  /// [Billing.fromJson] converts a JSON object to a [Billing] object.
  factory Billing.fromJson(Map<String, dynamic> json) {
    return Billing(
      id: json['id'],
      totalAmt: json['totalAmt'],
      deliveryFees: json['deliveryFees'],
      taxAmt: json['taxAmt'],
      discountAmt: json['discountAmt'],
      address: json['address'],
    );
  }
}
