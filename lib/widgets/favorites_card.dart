import 'package:flutter/material.dart';
import 'package:not_amazon/product/product.dart';

Widget favoriteCard(Product product) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
    child: SizedBox(
      height: 300,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(product.name),
              Text(product.price.toString()),
            ],
          ),
          Image.asset(product.images[0], height: 260, width: 260,)
        ],
      ),
    ),
  );
}