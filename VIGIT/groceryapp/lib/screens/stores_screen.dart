/// This file contains all the widgets regarding Stores

import 'package:flutter/material.dart';
import 'package:groceryapp/models/item.dart';
import 'package:groceryapp/models/store.dart';
import 'package:groceryapp/screens/cart_screen.dart';
import 'package:groceryapp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/stores.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/counter.dart';
import '../widgets/filters.dart';

class AllStoresScreen extends StatefulWidget {
  static const String routeName = '/all-stores';
  const AllStoresScreen({Key? key}) : super(key: key);

  @override
  State<AllStoresScreen> createState() => _AllStoresScreenState();
}

class _AllStoresScreenState extends State<AllStoresScreen> {
  /// [_isSearching] is a boolean indicating whether the search bar is visible.
  bool _isSearching = false;

  /// [_searchController] and [_searchFocusNode] are used for search text field.
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  /// [initState] fetches the list of stores from the database.
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Stores>(context, listen: false).fetchAndSetStores();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stores = Provider.of<Stores>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                'All Stores',
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
              filters: stores.filters,
              applyFilter: stores.applyFilter,
            )
          : Column(
              children: <Widget>[
                AppliedFilters(stores.filters),
                Expanded(child: StoresGrid(stores.stores)),
              ],
            ),
      floatingActionButton: const BottomButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
    );
  }
}

/// [StoresGrid] displays data in a grid.
/// Each store is a [StoreCard] widget.
class StoresGrid extends StatelessWidget {
  final List<Store> _stores;
  const StoresGrid(this._stores, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: _stores.length,
        itemBuilder: (ctx, i) {
          return StoreCard(
            store: _stores[i],
          );
        },
      ),
    );
  }
}

/// [StoreCard] is a custom widget that displays the store's name, image, and rating.
/// It also contains a [GestureDetector] that will open the store's page.
class StoreCard extends StatelessWidget {
  const StoreCard({
    required this.store,
    Key? key,
  }) : super(key: key);

  final Store store;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          StoreDetailsScreen.routeName,
          arguments: store,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                child: GridTile(
                  footer: Center(
                    child: Text(
                      store.category.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Image.network(store.image, fit: BoxFit.cover),
                ),
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                store.name,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 12,
                ),
              ),
              subtitle: Text(
                store.description,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 12,
                ),
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
              trailing: Column(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.yellow.shade600,
                  ),
                  Text(
                    store.rating.toString(),
                    style: const TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// [StoreDetailsScreen] is the screen that contains the details of a particular store.
/// When navigating to this screen an [Store] is passed as an argument.
class StoreDetailsScreen extends StatelessWidget {
  static const String routeName = '/store-details';
  const StoreDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store store = ModalRoute.of(context)!.settings.arguments as Store;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: FloatingActionButton(
          elevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Image.network(store.image),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: ListTile(
                                title: Text(
                                  store.name,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                ),
                                subtitle: Text(
                                  store.category.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'DM Sans',
                                    color: Colors.green,
                                  ),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            const Spacer(),
                            // TODO: Replace with a star image.
                            Icon(
                              Icons.star_sharp,
                              color: Colors.yellow.shade600,
                            ),
                            Flexible(
                              child: ListTile(
                                title: RichText(
                                  text: TextSpan(
                                    text: '${store.rating}  ',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.green,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '(${store.ratingCount})',
                                        style: TextStyle(
                                          fontFamily: 'DM Sans',
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: const Text(
                                  'Reviews',
                                  style: TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <RichText>[
                                RichText(
                                  text: TextSpan(
                                    text: 'Delivery Time: ',
                                    style: const TextStyle(
                                      fontFamily: 'DM Sans',
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: store.deliveryTime,
                                        style: const TextStyle(
                                          fontFamily: 'DM Sans',
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Minimum Order: ',
                                    style: const TextStyle(
                                      fontFamily: 'DM Sans',
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: store.minOrder,
                                        style: const TextStyle(
                                          fontFamily: 'DM Sans',
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Timings: ',
                                    style: const TextStyle(
                                      fontFamily: 'DM Sans',
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: store.timings,
                                        style: const TextStyle(
                                          fontFamily: 'DM Sans',
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade100,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade100,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.call_rounded,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: CustomElevatedButton(
                          child: const Text(
                            'Write a Review',
                            style: TextStyle(fontFamily: 'DM Sans'),
                          ),
                          onPressed: () {
                            // TODO: Write a review.
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: CustomOutlinedButton(
                          onPressed: null,
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search this store',
                              hintStyle: TextStyle(fontFamily: 'DM Sans'),
                            ),
                            onSubmitted: (value) {
                              // TODO: Implement Search
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: Text(
                          'Offers',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        height: 200,
                        child: PageView.builder(
                          controller: PageController(
                            viewportFraction: 0.9,
                          ),
                          padEnds: false,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: OfferCard(),
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: Text(
                          'Products',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      StoreProducts(products: store.products),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

/// [StoreProducts] is a TEMPORARY widget
/// that displays the products of a particular store.
class StoreProducts extends StatelessWidget {
  const StoreProducts({
    required this.products,
    Key? key,
  }) : super(key: key);

  final List<Item> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) {
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: products[i],
            );
          },
          title: Text(products[i].name),
          trailing: Text(products[i].price.toString()),
        );
      },
      itemCount: products.length,
    );
  }
}

/// [ProductDetailsScreen] is the screen that contains the details of a particular product.
/// When navigating to this screen an [Item] is passed as an argument.
class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final Item productItem = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: FloatingActionButton(
          elevation: 0,
          hoverElevation: 0,
          highlightElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    productItem.image,
                  ),
                ),
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    size.width,
                    100.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Padding>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    productItem.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Counter(
                    count: quantity,
                    onAdd: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    onRemove: quantity > 1
                        ? () {
                            setState(() {
                              quantity--;
                            });
                          }
                        : null,
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                'Rs. ${productItem.price}/kg',
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(productItem.storeName),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: productItem.itemProperties.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      minLeadingWidth: 1,
                      leading: const Icon(
                        Icons.emoji_emotions_rounded,
                      ), // TODO: Icons based on property
                      title:
                          Text(productItem.itemProperties.values.elementAt(i)),
                      subtitle:
                          Text(productItem.itemProperties.keys.elementAt(i)),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomElevatedButton(
                child: const Text('Add to Cart'),
                onPressed: () {
                  cart.addItem(productItem, quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 2),
                      content: const Text('Added to Cart'),
                      action: SnackBarAction(
                        label: 'View',
                        onPressed: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
