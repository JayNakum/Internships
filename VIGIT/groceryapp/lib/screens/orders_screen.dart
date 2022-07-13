/// This file contains all the Screens and Widgets regarding Orders.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';

import '../models/billing.dart';
import '../models/order.dart';
import '../models/item.dart';
import '../widgets/billing_details.dart';
import '../widgets/custom_button.dart';
import '../widgets/filters.dart';

/// [AllOrdersScreen] is the screen that contains all the orders.
class AllOrdersScreen extends StatefulWidget {
  static const String routeName = '/all-orders';
  const AllOrdersScreen({Key? key}) : super(key: key);

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  /// [_isSearching] is a boolean indicating whether the search bar is visible.
  bool _isSearching = false;

  /// [_searchController] and [_searchFocusNode] are used for search text field.
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: _isSearching
            ? TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                cursorColor: Colors.green,
                decoration: const InputDecoration(
                  hintText: 'Search Here!',
                  border: InputBorder.none,
                ),
              )
            : const Text(
                'All Orders',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <IconButton>[
          // Search icon button
          IconButton(
            onPressed: () {
              if (!_isSearching) {
                _searchFocusNode.requestFocus();
                setState(() {
                  _isSearching = true;
                });
              } else {
                // TODO: Search
                _searchFocusNode.unfocus();
                setState(() {
                  _isSearching = false;
                });
              }
            },
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: _isSearching
          ? AddFilters(
              filters: orders.filters,
              applyFilter: orders.applyFilter,
            )
          : Column(
              children: <Widget>[
                /// A row to display all the applied filters.
                AppliedFilters(orders.filters),
                Expanded(child: OrdersList(orders.orders)),
              ],
            ),
    );
  }
}

/// [OrdersList] is the widget that goes through each [Order] in [_orders]
/// and displays a Column of [OrderItems].
class OrdersList extends StatelessWidget {
  final List<Order> _orders;
  const OrdersList(this._orders, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <OrderItems>[
          for (int index = 0; index < _orders.length; index++)
            OrderItems(
              order: _orders[index],
              canNavigate: true,
            ),
        ],
      ),
    );
  }
}

/// [OrderItems] widget goes through each [Item] of [_order]
/// and displays it in a ListView.
class OrderItems extends StatelessWidget {
  const OrderItems({
    Key? key,
    required Order order,
    bool canNavigate = false,
  })  : _order = order,
        _canNavigate = canNavigate,
        super(key: key);

  /// [_order] is the [Order] that is being displayed.
  /// [_canNavigate] is a boolean indicating whether the user can navigate to the [OrderDetailsScreen]
  /// or navigate to the [ItemDetailsScreen]. // TODO: ItemDetailsScreen
  final Order _order;
  final bool _canNavigate;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _order.items.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          onTap: _canNavigate
              ? () {
                  Navigator.pushNamed(
                    context,
                    OrderDetailsScreen.routeName,
                    arguments: _order,
                  );
                }
              : null,
          isThreeLine: true,
          leading: Image.network(_order.items[i].image),
          title: Text(
            _order.items[i].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'DM Sans',
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Text>[
              Text(
                'Quantity: ${_order.items[i].quantity}',
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
              Text(
                _order.items[i].storeName,
                style: const TextStyle(fontFamily: 'DM Sans'),
              ),
            ],
          ),
          trailing: Text(
            _order.items[i].price.toString(),
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        );
      },
    );
  }
}

/// [OrderDetailsScreen] is the screen that contains the details of a particular order.
/// When navigating to this screen an [Order] is passed as an argument.
/// This widget displays the details of the passed [Order] in [OrderDetails] widget
/// and [Billing] details in [BillingDetails] widget.
class OrderDetailsScreen extends StatelessWidget {
  static const String routeName = '/order-details';
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Order order = ModalRoute.of(context)!.settings.arguments as Order;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'Order Details',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.green,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Items',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
            OrderItems(order: order),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Order Details',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
            OrderDetails(
              date: order.date,
              orderNumber: order.orderNumber,
              orderStatus: order.orderStatus,
              refundStatus: order.refundStatus,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomElevatedButton(
                child: const Text(
                  'Track Order',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // TODO: Track Order
                },
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Billing',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
            BillingDetails(billing: order.billingDetails),
          ],
        ),
      ),
    );
  }
}

/// [OrderDetails] widget displays the [Order] details.
/// It gets [date], [orderNumber], [orderStatus], [refundStatus] as a parameter.
class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key? key,
    required this.date,
    required this.orderNumber,
    required this.orderStatus,
    required this.refundStatus,
  }) : super(key: key);

  final String orderNumber;
  final DateTime date;
  final OrderStatus orderStatus;
  final RefundStatus refundStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Row>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Text>[
              const Text(
                'Order Number:',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                orderNumber,
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
                'Order Date:',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${date.day}-${date.month}-${date.year}',
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
                'Order Status:',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                orderStatus.toString(),
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
                'Refund Status:',
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                refundStatus.toString(),
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
