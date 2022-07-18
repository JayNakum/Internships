import 'package:flutter/material.dart';

import 'order_screens/order_loading.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            // TODO: Navigator.of(context).popUntil(ModalRoute.withName(HomeScreen.routeName));
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (ctx, i) {
              return ListTile(
                dense: true,
                isThreeLine: true,
                leading: Image.network(
                    "http://assets.stickpng.com/thumbs/5b4eed0cc051e602a568ce0c.png"),
                title: Text(
                  "Ginger",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    Text(
                      'Rs. ${200}',
                      style: const TextStyle(
                        fontFamily: 'DM Sans',
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Arabic Ginger",
                      style: const TextStyle(fontFamily: 'DM Sans'),
                    ),
                  ],
                ),
                trailing: SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Colors.grey[100], shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "4",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
          if (false)
            const Center(
              child: Text(
                'No items in cart',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          if (true)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 25.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Billing",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Text>[
                                  const Text(
                                    'Total',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "150",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Text>[
                                  const Text(
                                    'Delivery Fees',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // if (billing.deliveryFees > 0.0)
                                  Text(
                                    "50",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // if (billing.deliveryFees == 0.0)
                                  //   const Text(
                                  //     'Free!',
                                  //     style: TextStyle(
                                  //       fontFamily: 'DM Sans',
                                  //     ),
                                  //   ),
                                ],
                              ),
                              // if (billing.taxAmt > 0.0)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Text>[
                                  const Text(
                                    'Tax and Charges',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "12",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              // if (billing.discountAmt > 0.0)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Text>[
                                  const Text(
                                    'Discount',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "18",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Text>[
                                  const Text(
                                    'Grand Total',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "180",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Container(
                                  width: MediaQuery.of(context).size.height,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.green,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.business,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "Pickup",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                      Expanded(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .height,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.delivery_dining,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Delivery",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              const SizedBox(height: 24),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          OrderLoadingScreen()));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.height,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.green,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Checkout",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
