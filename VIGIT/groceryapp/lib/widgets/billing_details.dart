import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/custom_button.dart';

import '../models/billing.dart';

/// [BillingDetails] widget displays the [Billing] details of an order.
/// It gets [billing] as a parameter.
class BillingDetails extends StatelessWidget {
  const BillingDetails({
    Key? key,
    required this.billing,
  }) : super(key: key);

  final Billing billing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Text>[
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                ),
              ),
              Text(
                billing.totalAmt.toString(),
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Text>[
              const Text(
                'Delivery Fees',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                ),
              ),
              if (billing.deliveryFees > 0.0)
                Text(
                  billing.deliveryFees.toString(),
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                  ),
                ),
              if (billing.deliveryFees == 0.0)
                const Text(
                  'Free!',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                  ),
                ),
            ],
          ),
          if (billing.taxAmt > 0.0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Text>[
                const Text(
                  'Tax and Charges',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                  ),
                ),
                Text(
                  billing.taxAmt.toString(),
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                  ),
                ),
              ],
            ),
          if (billing.discountAmt > 0.0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Text>[
                const Text(
                  'Discount',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                  ),
                ),
                Text(
                  billing.discountAmt.toString(),
                  style: const TextStyle(
                    fontFamily: 'DM Sans',
                  ),
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Text>[
              const Text(
                'Grand Total',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                billing.grandTotal.toString(),
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          CustomOutlinedButton(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                billing.address,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  color: Colors.black54,
                  fontWeight: FontWeight.w100,
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onPressed: () {
              //TODO: Update Address
            },
          )
        ],
      ),
    );
  }
}
