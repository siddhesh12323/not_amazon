import 'package:flutter/material.dart';
import 'package:not_amazon/product/product.dart';

Widget homeCartCard(Product product, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
     Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(product.images[0], height: 200, width: MediaQuery.of(context).size.width - 16,),
        const Icon(Icons.favorite_outline)
      ],
     ),
     Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
                child: Text(product.name),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                child: Text('${product.rating.toString()}/5.0'),
              )
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 16, 8),
          child: Text("From \$${product.price[0].toString()}")
        )
      ],
     )
    ],
  );
}