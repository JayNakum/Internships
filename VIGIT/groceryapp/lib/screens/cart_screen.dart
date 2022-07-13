import 'package:flutter/material.dart';
import 'package:groceryapp/screens/orders_screen.dart';
import 'package:groceryapp/widgets/billing_details.dart';
import 'package:groceryapp/widgets/counter.dart';
import 'package:groceryapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/orders.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context, listen: false);
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
            itemCount: cart.items.length,
            itemBuilder: (ctx, i) {
              return ListTile(
                dense: true,
                isThreeLine: true,
                leading: Image.network(cart.items[i].image),
                title: Text(
                  cart.items[i].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DM Sans',
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    Text(
                      'Rs. ${cart.items[i].price}',
                      style: const TextStyle(
                        fontFamily: 'DM Sans',
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      cart.items[i].storeName,
                      style: const TextStyle(fontFamily: 'DM Sans'),
                    ),
                  ],
                ),
                trailing: SizedBox(
                  width: 110,
                  child: Counter(
                    count: cart.items[i].quantity,
                    onAdd: () {
                      setState(() {
                        cart.items[i].quantity++;
                      });
                    },
                    onRemove: cart.items[i].quantity > 1
                        ? () {
                            setState(() {
                              cart.items[i].quantity--;
                            });
                          }
                        : null,
                  ),
                ),
              );
            },
          ),
          if (cart.items.isEmpty)
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
          if (cart.items.isNotEmpty)
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
                        BillingDetails(
                          billing: cart.getBillingDetails(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomElevatedButton(
                            child: const Text('Checkout'),
                            onPressed: () {
                              cart.checkOut(orders);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  AllOrdersScreen.routeName,
                                  ModalRoute.withName('/'));
                            },
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
