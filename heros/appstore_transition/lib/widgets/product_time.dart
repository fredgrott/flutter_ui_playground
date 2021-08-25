// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:appstore_transition/models/product.dart';
import 'package:appstore_transition/screen/productdetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  const ProductItem(this.product, {Key? key}) : super(key: key);
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push<dynamic>(
          PageRouteBuilder<dynamic>(
            /// [opaque] set false, then the detail page can see the home page screen.
            opaque: false,
            transitionDuration: const Duration(milliseconds: 700),
            fullscreenDialog: true,
            pageBuilder: (context, _, __) => const ProductDetailScreen(),
            settings: RouteSettings(arguments: widget.product.id),
          ),
        );
      },
      child: Hero(
        tag: widget.product.id,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(widget.product.image, fit: BoxFit.cover),
          ),
        ),
        flightShuttleBuilder:
            (flightContext, animation, direction, fromcontext, toContext) {
          final Hero toHero = toContext.widget as Hero;
          // Change push and pop animation.

          return direction == HeroFlightDirection.push
              ? ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(
                      begin: 0.75,
                      end: 1.02,
                    ).chain(
                      CurveTween(
                          curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),),
                    ),
                  ),
                  child: toHero.child,
                )
              : SizeTransition(
                  sizeFactor: animation,
                  child: toHero.child,
                );
        },
      ),
    );
  }
}
