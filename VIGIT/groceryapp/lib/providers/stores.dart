import 'package:flutter/foundation.dart';

import '../models/categories.dart';
import '../models/item.dart';
import '../models/store.dart';

class Stores with ChangeNotifier {
  /// [_stores] is a list (fetched from database). It contains the details of all stores.
  final List<Store> _stores = <Store>[];

  /// [_filteredStores] is a list (filtered from [_stores]). It contains the details of all stores.
  final List<Store> _filteredStores = <Store>[];

  /// [filters] is a Map<String, bool>.
  /// It contains the name of the filter as its key
  /// and whether the filter isApplied as its value.
  final Map<String, bool> filters = {
    'Sort by: Categories': false,
    'Sort by: A-Z': false,
    'Sort by: Z-A': false,
  };

  List<Store> get stores => _filteredStores;

  void fetchAndSetStores() {
    _stores.clear();
    _stores.addAll(<Store>[
      Store(
        id: '1',
        name: 'Store 1',
        description: 'This is Store 1',
        category: Categories.groceries,
        image:
            'https://www.gecurrent.com/sites/default/files/styles/large/public/images/how-is-the-grocery-store-footprint-changing-850x567.jpg?itok=iwp-U_eS',
        products: <Item>[
          Item(
            id: '1',
            name: 'Amul Milk',
            storeName: 'Store 1',
            price: 50.0,
            image:
                'https://bsmedia.business-standard.com/_media/bs/img/article/2021-05/29/full/1622277315-2918.jpg',
            itemProperties: {
              'Organic': '100%',
              'Expiration': '1 Year',
              'Review': '4.8 (256)',
              '100 Gram': '80 kcal',
            },
          ),
          Item(
            id: '2',
            name: 'Red Capsicum',
            storeName: 'Store 1',
            price: 180.0,
            image:
                'https://patnakart.in/wp-content/uploads/2021/07/bell_pepper_red.jpg',
            itemProperties: {
              'Organic': '100%',
              'Expiration': '1 Year',
              'Review': '4.8 (256)',
              '100 Gram': '80 kcal',
            },
          ),
        ],
        rating: 4.5,
        ratingCount: 256,
      ),
      const Store(
        id: '2',
        name: 'Store 2',
        description: 'This is Store 2',
        category: Categories.other,
        image:
            'https://images.unsplash.com/photo-1628102491629-778571d893a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
        rating: 4.0,
        ratingCount: 120,
      ),
      const Store(
        id: '3',
        name: 'Store 3',
        description: 'This is Store 3',
        category: Categories.fruitsAndVegetables,
        image:
            'https://images.unsplash.com/photo-1607349913338-fca6f7fc42d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
        rating: 3.5,
        ratingCount: 78,
      ),
    ]);

    _filteredStores.clear();
    _filteredStores.addAll(_stores);
    notifyListeners();
  }

  Store getStoreById(String id) =>
      _stores.firstWhere((store) => store.id == id);

  void applyFilter(String filterName) {
    if (filters[filterName] ?? false) {
      filters.update(filterName, (value) => false);

      switch (filterName) {
        case 'test':
          _filteredStores.clear();
          break;
        default:
          _filteredStores.clear();
          _filteredStores.addAll(_stores);
          break;
      }
    } else {
      filters.update(filterName, (value) => true);

      switch (filterName) {
        case 'Sort by: A-Z':
          _filteredStores.sort((a, b) => a.name.compareTo(b.name));
          break;
        case 'Sort by: Z-A':
          _filteredStores.sort((a, b) => b.name.compareTo(a.name));
          break;
        case 'Sort by: Categories':
          _filteredStores.sort(
              (a, b) => a.category.toString().compareTo(b.category.toString()));
          break;
        default:
          _filteredStores.clear();
          _filteredStores.addAll(_stores);
          break;
      }
    }
    notifyListeners();
  }
}
