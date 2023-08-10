import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:not_amazon/product/product.dart';
import 'package:not_amazon/theme%20elements/appbar_text_theme.dart';
import 'package:not_amazon/widgets/home_page_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: appBarTextStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 98, 95, 95),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            iconSize: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
            iconSize: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    items: const [
                      DropdownMenuItem(
                          value: 'Company', child: Text('Company')),
                      DropdownMenuItem(
                        value: 'Camera',
                        child: Text('Camera'),
                      ),
                      DropdownMenuItem(
                        value: 'Battery Life',
                        child: Text('Battery Life'),
                      )
                    ],
                    onChanged: (value) {},
                  )),
            ],
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: homeCartCard(products[index], context),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/product', arguments: products[index].name);
                  },
                );
              },
              itemCount: products.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}
