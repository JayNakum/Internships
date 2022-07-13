import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/orders.dart';
import './providers/stores.dart';
import './providers/cart.dart';

import './screens/cart_screen.dart';
import './screens/stores_screen.dart';
import './screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Stores(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        title: 'Grocery App',
        home: const AllStoresScreen(),
        routes: {
          AllStoresScreen.routeName: (ctx) => const AllStoresScreen(),
          StoreDetailsScreen.routeName: (ctx) => const StoreDetailsScreen(),
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          AllOrdersScreen.routeName: (ctx) => const AllOrdersScreen(),
          OrderDetailsScreen.routeName: (ctx) => const OrderDetailsScreen(),
        },
      ),
    );
  }
}
