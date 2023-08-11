import 'package:flutter/material.dart';
import 'package:not_amazon/product/product.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme elements/appbar_text_theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.appBarTitle});
  final String appBarTitle;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Product? product;
    //int currentIndex = 0;
    switch (widget.appBarTitle) {
      case "Xiaomi 13 Ultra":
        product = products[0];
        break;
      case "iPhone 14 Pro Max":
        product = products[1];
        break;
      case "Oppo Find X6 Pro":
        product = products[2];
        break;
      case "Samsung Galaxy S23 Ultra":
        product = products[3];
        break;
      case "Vivo X90 Pro Plus":
        product = products[4];
        break;
      default:
        product = null;
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.appBarTitle,
            style: appBarTextStyle,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: const Color.fromARGB(255, 98, 95, 95),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value % product!.images.length;
                        });
                      },
                      itemCount: product!.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Image.asset(
                              product!.images[index % product.images.length],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  ],
                )
              ],
            ),
            getSizedBox(10, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < product.images.length; i++)
                  buildIndicator(currentIndex == i)
              ],
            ),
            getSizedBox(10, 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => _launchURL(product!.url),
                    child: const Text(
                      'Visit the company store',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${product.rating.toString()}/5.0',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }

  Widget getSizedBox(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  _launchURL(String url) async {
    Uri _url = Uri.parse(url);
    if (await launchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
}
