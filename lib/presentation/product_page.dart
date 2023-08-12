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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //! PRODUCT IMAGES
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
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.share)),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_outline)),
                    ],
                  )
                ],
              ),
              getSizedBox(10, 0),
              //! NUMBER OF IMAGES INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < product.images.length; i++)
                    buildIndicator(currentIndex == i)
                ],
              ),
              getSizedBox(10, 0),
              //! VISIT COMPANY PAGE AND RATING
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
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              //! PRODUCT NAME
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                child: Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
              //! RAM STORAGE OPTIONS
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0;
                            i < product.ramStorageOptions.length;
                            i++)
                          returnRamStorageOptions(product, i),
                      ],
                    ),
                  )),
              //! Price
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  '\$${product.price[0].toString()}',
                  style: TextStyle(fontSize: 19),
                ),
              ),
              //! ADD TO CART
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Add to Cart"),
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              //! BUY NOW
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Buy Now"),
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 199, 92),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              //! DESCRIPTION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(product.description),
              )
            ],
          ),
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
    } else {
      throw 'Could not launch $_url';
    }
  }

  Widget returnRamStorageOptions(Product product, int iteration) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
      child: FilterChip(
          label: Text(product.ramStorageOptions[iteration]),
          onSelected: (value) {}),
    );
  }
}
