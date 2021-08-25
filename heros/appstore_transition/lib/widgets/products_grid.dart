// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:appstore_transition/providers/products.dart';
import 'package:appstore_transition/widgets/product_time.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false).item;

    return GridView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        
        return ProductItem(products[i]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 30,
      ),
    );
  }
}
