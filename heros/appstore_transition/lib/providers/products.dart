// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:appstore_transition/models/product.dart';
import 'package:flutter/widgets.dart';

class Products with ChangeNotifier {
  final List<Product> _item = [
    Product(id: 'image1', image: 'assets/img/image1.jpg'),
    Product(id: 'image2', image: 'assets/img/image2.jpg'),
    Product(id: 'image3', image: 'assets/img/image3.jpg'),
  ];
  List<Product> get item {
    return [..._item];
  }

  Product findById(String id) {
    return _item.firstWhere((product) => product.id == id);
  }
}
